import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.url,
    this.height = 150,
    this.width,
    this.fit = BoxFit.cover,
    this.borderRadius = 16,
  });

  final String url;
  final double height;
  final double? width;
  final BoxFit fit;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        url,
        height: height,
        width: width,
        fit: fit,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            height: height,
            width: width,
            color: const Color(0xFFE9EEF2),
            alignment: Alignment.center,
            child: const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) => Container(
          height: height,
          width: width,
          color: const Color(0xFFE9EEF2),
          alignment: Alignment.center,
          child: const Icon(Icons.image_not_supported_outlined, size: 34, color: Color(0xFF66758A)),
        ),
      ),
    );
  }
}
