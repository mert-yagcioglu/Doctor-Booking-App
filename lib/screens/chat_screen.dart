import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final ImagePicker _picker = ImagePicker();

  void _sendMessage({String? text, File? file, bool isVideo = false}) {
    if (text != null && text.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': text,
          'isUser': true,
          'time': DateTime.now().toLocal().toString().split(' ')[1].substring(0, 5),
        });
        _controller.clear();
      });
    } else if (file != null) {
      setState(() {
        _messages.add({
          'file': file,
          'isVideo': isVideo,
          'isUser': true,
          'time': DateTime.now().toLocal().toString().split(' ')[1].substring(0, 5),
        });
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _sendMessage(file: File(pickedFile.path));
    }
  }

  Future<void> _pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      _sendMessage(file: File(pickedFile.path), isVideo: true);
    }
  }

  Future<bool> _onWillPop() async {
    Navigator.pushReplacementNamed(context, '/contacts');
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chat'),
          backgroundColor: theme.primaryColor,
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.05), // Daha açık bir arka plan rengi
                image: DecorationImage(
                  image: AssetImage('assets/images/health_background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(8.0),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      return Align(
                        alignment: message['isUser']
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: message['file'] != null
                            ? Column(
                          crossAxisAlignment: message['isUser']
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            message['isVideo']
                                ? Container(
                              margin: EdgeInsets.symmetric(vertical: 5.0),
                              width: 150,
                              height: 150,
                              child: VideoPlayerWidget(file: message['file']),
                            )
                                : Image.file(
                              message['file'],
                              width: 150,
                              height: 150,
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              message['time'],
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        )
                            : Container(
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: message['isUser']
                                ? theme.primaryColor.withOpacity(0.8)
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            crossAxisAlignment: message['isUser']
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Text(
                                message['text'],
                                style: TextStyle(fontSize: 16.0, color: message['isUser'] ? Colors.white : Colors.black),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                message['time'],
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.photo, color: theme.primaryColor),
                        onPressed: _pickImage,
                      ),
                      IconButton(
                        icon: Icon(Icons.videocam, color: theme.primaryColor),
                        onPressed: _pickVideo,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: 'Mesaj yazınız...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send, color: theme.primaryColor),
                        onPressed: () => _sendMessage(text: _controller.text),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final File file;

  VideoPlayerWidget({required this.file});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.file)
      ..initialize().then((_) {
        setState(() {}); // Ensure the first frame is shown after the video is initialized
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    )
        : Center(child: CircularProgressIndicator());
  }
}
