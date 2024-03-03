import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/services/story.dart';
import 'package:instagram_clone/state/story/feed_stories_provider.dart';

class StoryCaptureScreen extends ConsumerStatefulWidget {
  const StoryCaptureScreen({super.key});

  @override
  ConsumerState<StoryCaptureScreen> createState() => _StoryCaptureScreenState();
}

class _StoryCaptureScreenState extends ConsumerState<StoryCaptureScreen> {
  Future<void> onUploadStory(String path) async {
    try {
      await StoryService.createStory(localFilePath: path);

      if (!mounted) return;

      ref.read(feedStoriesProvider.notifier).invalidate();
      context.goNamed(Routes.feed);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Your story has been uploaded')),
      );
    } catch (error) {
      // Do Nothing
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraAwesomeBuilder.custom(
        saveConfig: SaveConfig.photo(),
        builder: (state, preview) {
          state.captureState$.listen(
            (mediaCapture) {
              if (mediaCapture != null) {
                mediaCapture.captureRequest.when(single: (single) {
                  if (single.file != null && single.file?.path != null) {
                    onUploadStory(single.file!.path);
                  }
                });
              }
            },
          );

          return AwesomeCameraLayout(state: state);
        },
      ),
    );
  }
}
