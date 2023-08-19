import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String? imageUrl;

  const AppImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl ?? '',
      errorBuilder: (_, __, ___) {
        return const Icon(Icons.error);
      },
    );
  }
}
