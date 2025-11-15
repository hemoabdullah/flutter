import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() =>
      _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.blue.shade700;

  _showColorDialog(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Choose Your Color'),
          content: const Text('Select a color theme for your app'),
          actions: <Widget>[
            TextButton(
              child: const Text('Sunset Orange'), 
              onPressed: () {
                color = Colors.deepOrange.shade400; 
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Ocean Blue'), 
              onPressed: () {
                color = Colors.blue.shade800; 
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Forest Green'), 
              onPressed: () {
                color = Colors.green.shade700; 
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Royal Purple'), 
              onPressed: () {
                color = Colors.purple.shade600; 
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Cherry Red'), 
              onPressed: () {
                color = Colors.red.shade700; 
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Midnight Teal'), 
              onPressed: () {
                color = Colors.teal.shade800; 
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Golden Yellow'), 
              onPressed: () {
                color = Colors.amber.shade600; 
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Steel Gray'), 
              onPressed: () {
                color = Colors.grey.shade700; 
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Hot Pink'), 
              onPressed: () {
                color = Colors.pink.shade500; 
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Lime Green'), 
              onPressed: () {
                color = Colors.lime.shade600; 
                Navigator.pop(context, color);
              },
            ),
          ],
        );
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigation Dialog Screen'),
        backgroundColor: color.withValues(alpha: 0.8),
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.palette,
                    size: 50,
                    color: color,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Color Theme Selector',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Current: #${color.toARGB32().toRadixString(16).substring(2).toUpperCase()}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: const Icon(Icons.color_lens),
              label: const Text('Change Color'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: color,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 5,
              ),
              onPressed: () {
                _showColorDialog(context);
              },
            ),
            const SizedBox(height: 15),
            TextButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text('Reset to Default'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black.withValues(alpha: 0.3),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              onPressed: () {
                setState(() {
                  color = Colors.blue.shade700;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}