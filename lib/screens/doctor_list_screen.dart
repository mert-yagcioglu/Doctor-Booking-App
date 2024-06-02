import 'package:flutter/material.dart';

class DoctorListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doctor List')),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: Text('Doctor 1'),
              onTap: () {
                Navigator.pushNamed(context, '/doctorProfile');
              },
            ),
          ],
        ),
      ),
    );
  }
}
