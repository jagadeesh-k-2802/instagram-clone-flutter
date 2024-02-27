import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoItem extends StatefulWidget {
  final bool isLocal;
  final String? networkUrl;
  final Future<File?>? file;

  const VideoItem({
    super.key,
    required this.isLocal,
    this.networkUrl,
    this.file,
  });

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  VideoPlayerController? controller;
  bool showControls = false;
  bool isVisible = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.isLocal && widget.file != null) {
        File? file = await widget.file;

        if (file != null) {
          controller = VideoPlayerController.file(file)
            ..setLooping(true)
            ..initialize().then((_) => setState(() {}));

          controller?.play();
          setState(() {});
        } else {
          throw Exception('VideoItem: File passed was null');
        }
      } else if (!widget.isLocal && widget.networkUrl != null) {
        Uri uri = Uri.parse(widget.networkUrl ?? '');

        controller = VideoPlayerController.networkUrl(uri)
          ..setLooping(true)
          ..initialize().then((_) => setState(() {}));

        controller?.play();
        setState(() {});
      } else {
        throw Exception('VideoItem: Invalid parameters have been passed');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller?.value.isBuffering == true || controller == null) {
      return const CircularProgressIndicator();
    }

    return VisibilityDetector(
      key: Key(widget.networkUrl ?? ''),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;

        if (visiblePercentage < 100 && mounted) {
          controller?.pause();
          setState(() => isVisible = false);
        } else {
          if (mounted) {
            controller?.play();
            setState(() => isVisible = true);
          }
        }
      },
      child: isVisible
          ? VideoPlayer(controller!)
          : widget.networkUrl != null
              ? CachedNetworkImage(
                  imageUrl:
                      widget.networkUrl?.replaceFirst('.mp4', '.jpg') ?? '',
                  fit: BoxFit.cover,
                )
              : Container(),
    );
  }
}
