import 'package:flutter/material.dart';

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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemCount: widget.itemCount,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: widget.itemBuilder,
    );
  }
}
