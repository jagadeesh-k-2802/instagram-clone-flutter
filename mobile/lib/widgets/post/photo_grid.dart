import 'package:flutter/material.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:instagram_clone/widgets/post/post_grid_item.dart';

/// [PhotoGrid] creates instagram like 3 column grid to show
/// photos using [PostGridItem] most probably
class PhotoGrid extends StatefulWidget {
  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;

  const PhotoGrid({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
  });

  @override
  State<PhotoGrid> createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: photoGridDelegate,
      itemCount: widget.itemCount,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: widget.itemBuilder,
    );
  }
}
