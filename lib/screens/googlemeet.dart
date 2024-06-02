//Package imports
import 'package:flutter/material.dart';

//File imports
import 'package:doctor_booking_app_with_flutter_and_bloc/screens/home_screen.dart';

import 'homescreen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Meet',
      theme: ThemeData(
          primaryColor: Colors.grey[900],
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
                  backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.blueAccent),
                  foregroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white)))),
      home: const HomeScreen2(),
    );
  }
}