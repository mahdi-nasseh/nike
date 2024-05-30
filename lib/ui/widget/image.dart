import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachImage extends StatelessWidget {
  final String imageUrl;
  final BorderRadius borderRadius;

  const CachImage({
    super.key,
    required this.imageUrl,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
