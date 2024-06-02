import 'package:flutter/material.dart';
import 'package:doctor_booking_app_with_flutter_and_bloc/models/data_store.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:doctor_booking_app_with_flutter_and_bloc/screens/meeting_screen.dart';
import 'package:doctor_booking_app_with_flutter_and_bloc/services/join_service.dart';
import 'package:doctor_booking_app_with_flutter_and_bloc/services/sdk_initializer.dart';

class BookingScreen extends StatelessWidget {
  final String doctorName = "Dr. Aslı Eker"; // Doktor ismi
  final String appointmentDate = "12 Haziran 2024"; // Randevu tarihi
  final String appointmentTime = "14:00"; // Randevu saati

  late UserDataStore _dataStore;
  bool isLoading = false;

  Future<void> getPermissions() async {
    await Permission.camera.request();
    await Permission.microphone.request();

    while ((await Permission.camera.isDenied)) {
      await Permission.camera.request();
    }
    while ((await Permission.microphone.isDenied)) {
      await Permission.microphone.request();
    }
  }

  Future<bool> joinRoom(BuildContext context) async {
    isLoading = true;
    await SdkInitializer.hmssdk.build();
    _dataStore = UserDataStore();
    _dataStore.startListen();
    bool isJoinSuccessful = await JoinService.join(SdkInitializer.hmssdk);
    if (!isJoinSuccessful) {
      return false;
    }
    isLoading = false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Randevularım"),
        backgroundColor: colorScheme.primary,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/health_background.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8),
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '1 yeni randevunuz var!',
                            style: textTheme.headline6!.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Doktor: $doctorName',
                            style: textTheme.subtitle1!.copyWith(
                              color: colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Tarih: $appointmentDate',
                            style: textTheme.subtitle1!.copyWith(
                              color: colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Saat: $appointmentTime',
                            style: textTheme.subtitle1!.copyWith(
                              color: colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () async {
                              await getPermissions();
                              bool isJoined = await joinRoom(context);
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
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Hata!")),
                                );
                              }
                            },
                            child: const Text('Randevuya Katıl'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.primary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                              textStyle: const TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/selectPackage');
                            },
                            child: const Text('Randevu Oluştur'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.secondary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                              textStyle: const TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
