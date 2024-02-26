import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// [PostGridItem] used to show photo thumbnail specifically in a grid
/// takes [imageUrl] and [onTap]
class PostGridItem extends StatelessWidget {
  final void Function() onTap;
  final String imageUrl;

  const PostGridItem({
    super.key,
    required this.onTap,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
          )
        ],
      ),
    );
  }
}
