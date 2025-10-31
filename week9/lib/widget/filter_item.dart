import 'package:flutter/material.dart';

@immutable
class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.color,
    this.onFilterSelected,
  });

  final Color color;
  final VoidCallback? onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterSelected,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ClipOval(
            child: Image.network(
              // Using a beautiful gradient texture for filter previews
              'https://images.unsplash.com/photo-1557672172-298e090bd0f1?w=400&h=400&fit=crop',
              color: color.withOpacity(0.5),
              colorBlendMode: BlendMode.hardLight,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  color: color.withOpacity(0.3),
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white54),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                // Fallback when the image can't be loaded - show colored gradient
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color.withOpacity(0.7), color.withOpacity(0.3)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Center(
                    child: Icon(Icons.photo_filter, color: Colors.white54, size: 32),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
