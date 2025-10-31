import 'dart:io';
import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'filter_selector.dart';

@immutable
class PhotoFilterCarousel extends StatefulWidget {
  const PhotoFilterCarousel({super.key, this.imageFile});

  // Optional captured image file (from Praktikum 1). If provided, the
  // carousel will use this image instead of the network placeholder.
  final XFile? imageFile;

  @override
  State<PhotoFilterCarousel> createState() => _PhotoFilterCarouselState();
}

class _PhotoFilterCarouselState extends State<PhotoFilterCarousel> {
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    )
  ];

  final _filterColor = ValueNotifier<Color>(Colors.white);

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('🎨 Creative Filter Studio'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: _buildPhotoWithFilter(),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: _buildFilterSelector(),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoWithFilter() {
    return ValueListenableBuilder<Color>(
      valueListenable: _filterColor,
      builder: (context, color, child) {
        // If an image file was provided (from Praktikum 1), use it. On Web
        // we must read bytes and use Image.memory; on mobile we can use Image.file.
        if (widget.imageFile != null) {
          final file = widget.imageFile!;
          if (kIsWeb) {
            return FutureBuilder<Uint8List>(
              future: file.readAsBytes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                  return Image.memory(
                    snapshot.data!,
                    color: color.withOpacity(0.5),
                    colorBlendMode: BlendMode.color,
                    fit: BoxFit.cover,
                  );
                } else if (snapshot.hasError) {
                  return _buildImageError();
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          } else {
            return Image.file(
              File(file.path),
              color: color.withOpacity(0.5),
              colorBlendMode: BlendMode.color,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => _buildImageError(),
            );
          }
        }

        // Default: use a nature/landscape placeholder for demo purposes
        // Note: After taking a photo with the camera, that photo will be shown here instead
        return Stack(
          children: [
            Image.network(
              // Using a beautiful nature image as placeholder for demonstration
              'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=1200&h=2000&fit=crop',
              color: color.withOpacity(0.5),
              colorBlendMode: BlendMode.color,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => _buildImageError(),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator(color: Colors.white));
              },
            ),
            // Info overlay
            Positioned(
              top: 80,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '📸 Tip: Use "Capture & Edit Photo" to apply filters to your own photos!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildImageError() {
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.broken_image, color: Colors.white54, size: 48),
          SizedBox(height: 8),
          Text('Image not available', style: TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }

  Widget _buildFilterSelector() {
    return FilterSelector(
      onFilterChanged: _onFilterChanged,
      filters: _filters,
    );
  }
}
