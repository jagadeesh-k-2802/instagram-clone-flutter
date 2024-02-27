import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/config/assets.dart';

/// [PostGridItem] used to show photo thumbnail specifically in a grid
/// takes [assetUrl] and [onTap]
class PostGridItem extends StatelessWidget {
  final int assetsCount;
  final String assetUrl;
  final void Function() onTap;

  const PostGridItem({
    super.key,
    required this.assetUrl,
    required this.assetsCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Positioned.fill(
            child: assetUrl.endsWith('.mp4')
                ? CachedNetworkImage(
                    imageUrl: assetUrl.replaceFirst('.mp4', '.jpg'),
                    fit: BoxFit.cover,
                  )
                : CachedNetworkImage(
                    imageUrl: assetUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          Visibility(
            visible: assetsCount > 1,
            child: Positioned.fill(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SvgPicture.asset(
                    AssetsConstants.multiPosts,
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: assetUrl.endsWith('.mp4'),
            child: const Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Icon(Icons.videocam, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
