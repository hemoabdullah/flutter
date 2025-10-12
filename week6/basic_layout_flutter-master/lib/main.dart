import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Widget: Foto + Nama
  Widget _buildStack() {
    return Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('images/1.JPG'),
          radius: 100,
        ),
        Container(
          decoration: const BoxDecoration(color: Colors.black45),
          padding: const EdgeInsets.all(8),
          child: const Text(
            'Hammam Abdullah',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  // Widget: Kartu Informasi Kontak
  Widget _buildCard() {
    return SizedBox(
      height: 210,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: const [
            ListTile(
              title: Text(
                'jalan angkawijaya',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              subtitle: Text('Malang kec wagir 8A'),
              leading: Icon(Icons.location_on, color: Colors.blueAccent),
            ),
            Divider(),
            ListTile(
              title: Text(
                '088805204080',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(Icons.phone, color: Colors.blueAccent),
            ),
            ListTile(
              title: Text('yesimhem@gmail.com'),
              leading: Icon(Icons.email, color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hammam Abdullah 3I'),
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            const SizedBox(height: 32),
            Center(child: _buildStack()),
            const SizedBox(height: 24),
            _buildCard(),
          ],
        ),
      ),
    );
  }
}
