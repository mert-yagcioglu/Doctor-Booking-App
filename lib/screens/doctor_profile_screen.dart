import 'package:flutter/material.dart';

class DoctorProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doctor Profile')),
      body: Center(
        child: Column(
          children: [
            Text('Doctor Details'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/selectPackage');
              },
              child: Text('Book Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
