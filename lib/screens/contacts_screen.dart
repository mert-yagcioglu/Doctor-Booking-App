import 'package:flutter/material.dart';
import 'package:models/src/doctor.dart'; // Doğru yolu kullanarak doctor.dart dosyasını içe aktarın

class ContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Örnek doktor listesini çekelim
    final List<Doctor> doctors = Doctor.sampleDoctors;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mesajlaşma'),
        backgroundColor: theme.primaryColor,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9), // Daha beyaz bir arka plan rengi
            ),
          ),
          ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(doctor.profileImageUrl),
                ),
                title: Text(doctor.name),
                onTap: () {
                  Navigator.pushNamed(context, '/chat', arguments: doctor.name);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
