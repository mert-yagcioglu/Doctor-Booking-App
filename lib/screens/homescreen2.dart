import 'package:flutter/material.dart';
import 'package:doctor_booking_app_with_flutter_and_bloc/models/data_store.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:doctor_booking_app_with_flutter_and_bloc/screens/meeting_screen.dart';
import 'package:doctor_booking_app_with_flutter_and_bloc/services/join_service.dart';
import 'package:doctor_booking_app_with_flutter_and_bloc/services/sdk_initializer.dart';

import '../shared/widgets/buttons/app_icon_button.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  late UserDataStore _dataStore;
  bool isLoading = false;

  @override
  void initState() {
    getPermissions();
    super.initState();
  }

  void getPermissions() async {
    await Permission.camera.request();
    await Permission.microphone.request();

    while ((await Permission.camera.isDenied)) {
      await Permission.camera.request();
    }
    while ((await Permission.microphone.isDenied)) {
      await Permission.microphone.request();
    }
  }

  Future<bool> joinRoom() async {
    setState(() {
      isLoading = true;
    });
    await SdkInitializer.hmssdk.build();
    _dataStore = UserDataStore();
    _dataStore.startListen();
    bool isJoinSuccessful = await JoinService.join(SdkInitializer.hmssdk);
    if (!isJoinSuccessful) {
      return false;
    }
    setState(() {
      isLoading = false;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent, // Ekranın arka plan rengini şeffaf yap
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor, // AppBar arka planını şeffaf yap
          elevation: 0,
          title: const Text("Görüntülü Görüşme"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: ClipOval(
                child: Image.asset(
                  'assets/images/avatar.jpg',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: const Text(
                  'Psikolog Uygulaması',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.settings_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Ayarlar'),
                  ],
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.feedback_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Geribildirim Gönder'),
                  ],
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.help_outline),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Yardım'),
                  ],
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Container(
          color: Colors.transparent, // Ekranın arka plan rengini şeffaf yap
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: colorScheme.primary),
                      backgroundColor: colorScheme.primary,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 200,
                            child: ListView(
                              padding: EdgeInsets.zero,
                              children: <Widget>[
                                ListTile(
                                  title: const Row(
                                    children: [
                                      Icon(Icons.video_call),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Görüşme Başlat'),
                                    ],
                                  ),
                                  onTap: () async {
                                    bool isJoined = await joinRoom();
                                    if (isJoined) {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => ListenableProvider.value(
                                            value: _dataStore,
                                            child: const MeetingScreen(),
                                          ),
                                        ),
                                      );
                                    } else {
                                      const SnackBar(content: Text("Hata!"));
                                    }
                                  },
                                ),
                                ListTile(
                                  title: const Row(
                                    children: [
                                      Icon(Icons.close),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Kapat'),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: const Text('Yeni Görüşme'),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: colorScheme.primary),
                      backgroundColor: colorScheme.primary,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: const Text('Kod ile Görüşmeye Katıl'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
