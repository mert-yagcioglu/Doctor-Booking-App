import 'package:flutter/material.dart';

class SelectPackageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paket Seç'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16.0),
                PackageCard(
                  title: 'Temel Paket (150₺)',
                  description: '45 dk. Görüntülü Konuşma',
                  icon: Icons.video_call,
                  onTap: () {
                    Navigator.pushNamed(context, '/inputDetails');
                  },
                ),
                PackageCard(
                  title: 'Standart Paket (250₺)',
                  description: '60 dk. Görüntülü Konuşma + Mesajlaşma',
                  icon: Icons.chat,
                  onTap: () {
                    Navigator.pushNamed(context, '/inputDetails');
                  },
                ),
                PackageCard(
                  title: 'Premium Paket (350₺)',
                  description: '90 dk. Görüntülü Konuşma + Mesajlaşma + Telefon Desteği',
                  icon: Icons.phone,
                  onTap: () {
                    Navigator.pushNamed(context, '/inputDetails');
                  },
                ),
                PackageCard(
                  title: 'Özel Paket (450₺ yerine 400₺)',
                  description: '120 dk. Görüntülü Konuşma + Mesajlaşma + Yüz Yüze Görüşme',
                  icon: Icons.person,
                  onTap: () {
                    Navigator.pushNamed(context, '/inputDetails');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  PackageCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: Icon(
          icon,
          size: 40,
          color: Colors.blueAccent,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(fontSize: 16),
        ),
        onTap: onTap,
      ),
    );
  }
}
