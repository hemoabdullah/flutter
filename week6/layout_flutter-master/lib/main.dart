import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'History Maker',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'The Greatest Football Player of All Time - Cristiano Ronaldo',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          const Padding(padding: EdgeInsets.only(left: 8.0), child: Text('99')),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    // buttonSection: baris yang berisi 3 kolom tombol
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    // textSection: deskripsi panjang
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'A legendary field where determination meets destiny, surrounded by roaring crowds and blazing lights. '
        'The air vibrates with energy as a lone warrior in crimson armor stands tall, embodying strength and passion. '
        'Every heartbeat echoes through the arena, carrying the spirit of victory and unyielding will beneath the vast night sky. '
        'Hammam Abdullah 2341720203',

        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout Hammam Abdullah 2341720203',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter layout demo')),
        body: ListView(
          children: [
            Image.asset(
              'images/cr7.png',
              width: double.infinity,
              height: 240,
              fit: BoxFit.cover,
            ),
            Image.asset(
              'images/prac1.gif',
              width: double.infinity,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
