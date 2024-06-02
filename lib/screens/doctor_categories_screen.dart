import 'package:flutter/material.dart';

class DoctorCategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doctor Categories')),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: Text('Category 1'),
              onTap: () {
                Navigator.pushNamed(context, '/doctorList');
              },
            ),
          ],
        ),
      ),
    );
  }
}
