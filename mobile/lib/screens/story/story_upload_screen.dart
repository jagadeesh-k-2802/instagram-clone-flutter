import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/services/story.dart';
import 'package:instagram_clone/state/story/feed_stories_provider.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class StoryUploadScreen extends ConsumerStatefulWidget {
  final Object? data;

  const StoryUploadScreen({
    super.key,
    required this.data,
  });

  @override
  ConsumerState<StoryUploadScreen> createState() => _StoryUploadScreenState();
}

class _StoryUploadScreenState extends ConsumerState<StoryUploadScreen> {
  AssetEntity? asset;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.data is AssetEntity) {
        setState(() => asset = widget.data as AssetEntity);
      } else {
        throw Exception(
          'StoryUploadScreen: takes only AssetEntity as param',
        );
      }
    });
  }

  Future<void> onUploadStory() async {
    try {
      File? file = await asset?.file;

      if (file != null) {
        await StoryService.createStory(localFilePath: file.path);
      } else {
        throw Exception('Something went wrong');
      }

      if (!mounted) return;

      ref.read(feedStoriesProvider.notifier).invalidate();
      context.goNamed(Routes.feed);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Your story has been uploaded')),
      );
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () => (context.pop(context)),
                            icon: const Icon(
                              Icons.close,
                              size: 30,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: asset != null
                        ? AssetEntityImage(
                            asset!,
                            fit: BoxFit.cover,
                            isOriginal: true,
                          )
                        : const CircularProgressIndicator(),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ElevatedButton.icon(
                                onPressed: onUploadStory,
                                icon: const Icon(Icons.chevron_left),
                                label: const Text('Upload'),
                                style: roundedButtonStyle,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
