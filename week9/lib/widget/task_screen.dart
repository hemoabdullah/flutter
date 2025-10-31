import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'takepicture_screen.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Assignment'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Assignment: Capture a photo using the camera, then apply creative filters to enhance your image!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.camera_alt),
              label: const Text('🚀 Start Assignment - Capture & Apply Filters'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                try {
                  final cameras = await availableCameras();
                  if (cameras.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No cameras available')),
                    );
                    return;
                  }
                  final firstCamera = cameras.first;
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => TakePictureScreen(camera: firstCamera),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error initializing camera: $e')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
