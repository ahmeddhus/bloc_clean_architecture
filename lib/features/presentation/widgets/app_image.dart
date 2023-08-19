import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String? imageUrl;
  final BoxFit? fit;

  const AppImage({super.key, required this.imageUrl, this.fit});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl ?? '',
      fit: fit,
      errorBuilder: (_, __, ___) {
        return const Icon(Icons.error);
      },
    );
  }
}
