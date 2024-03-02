import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/models/story.dart';
import 'package:instagram_clone/theme/theme.dart';

const int _storySeconds = 6;

class StoryDetailScreen extends StatefulWidget {
  final Object? data;

  const StoryDetailScreen({
    super.key,
    required this.data,
  });

  @override
  State<StoryDetailScreen> createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
  GetFeedStoriesResponseData? story;
  int currentIndex = 0;
  double currentTime = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.data is GetFeedStoriesResponseData) {
        setState(() => story = widget.data as GetFeedStoriesResponseData);
        timer = Timer.periodic(const Duration(milliseconds: 250), onTimerEnd);

        if (story?.hasPending == true) {
          for (int i = 0; i < story!.stories.length; i++) {
            if (!story!.stories[i].isViewed == true) {
              currentIndex = i;
              break;
            }
          }
        }
      } else {
        throw Exception(
          'StoryDetailScreen: takes only GetFeedStoriesResponseData as param',
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  void onNextIndex() {
    // TODO: Send view http request
    // TODO: Update local state
  }

  void onTimerEnd(Timer t) {
    setState(() => currentTime += 0.25);

    if (currentTime == _storySeconds) {
      setState(() => currentTime = 0);

      if (currentIndex < (story?.stories.length ?? 0) - 1) {
        setState(() => currentIndex++);
      } else {
        context.pop();
      }
    }
  }

  List<Widget> buildProgressBars() {
    List<Widget> output = [];

    story?.stories.indexed.forEach((element) {
      var (index, _) = element;
      bool currentItem = index == currentIndex;

      output.add(
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              tween: Tween<double>(
                begin: 0,
                end: currentTime / _storySeconds,
              ),
              builder: (context, value, _) => LinearProgressIndicator(
                value: currentItem
                    ? value
                    : index > currentIndex
                        ? 0
                        : 100,
                color: Colors.white,
                backgroundColor: Colors.grey,
              ),
            ),
          ),
        ),
      );
    });

    return output;
  }

  void onStoryTapDown(TapDownDetails details, BoxConstraints constraints) {
    bool isLeft = details.globalPosition.dx < constraints.maxWidth / 2;

    if (isLeft) {
      currentIndex -= 1;

      if (currentIndex < 0) {
        context.pop();
      }

      setState(() {
        currentTime = 0;
      });
    } else {
      currentIndex += 1;

      if (currentIndex > (story?.stories.length ?? 0) - 1) {
        context.pop();
      }

      setState(() {
        currentTime = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (story == null) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    StoryUserItem? user = story?.stories[0].user;
    StoryItem? storyItem = story?.stories[currentIndex];

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
                    child: Row(
                      children: buildProgressBars(),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 16.0,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: '$apiUrl/avatar/${user?.avatar}',
                              ),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Text(
                            story?.stories[0].user.username ?? '',
                            style: bodyLargeBold(context)?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTapDown: (details) => onStoryTapDown(
                        details,
                        constraints,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: '$apiUrl/story/${storyItem?.asset.url}',
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
