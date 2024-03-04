import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:instagram_clone/models/story.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/screens/story/story_detail_screen.dart';
import 'package:instagram_clone/state/global_state_provider.dart';
import 'package:instagram_clone/theme/theme.dart';

class StoryItem extends ConsumerStatefulWidget {
  final GetFeedStoriesResponseData story;
  final int index;
  final List<GetFeedStoriesResponseData>? storiesList;

  const StoryItem({
    super.key,
    required this.story,
    required this.index,
    required this.storiesList,
  });

  @override
  ConsumerState<StoryItem> createState() => _StoryItemState();
}

class _StoryItemState extends ConsumerState<StoryItem> {
  void navigateToAddStory() {
    context.pushNamed(Routes.newStory);
  }

  void navigateToStoryDetail() {
    context.pushNamed(
      Routes.storyDetail,
      extra: StoryDetailScreenArgs(
        initialIndex: widget.index,
        storiesList: widget.storiesList,
      ),
    );
  }

  Widget buildPlaceholderStory() {
    final textTheme = Theme.of(context).textTheme;
    UserResponseData? user = ref.read(globalStateProvider).user;

    return GestureDetector(
      onTap: navigateToAddStory,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 215, 215, 215),
                    Color.fromARGB(255, 215, 215, 215),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 35,
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: '$apiUrl/avatar/${user?.avatar}',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 53, left: 53),
                        child: Icon(
                          Icons.add_circle,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2.0),
            Text(
              'Your Story',
              style: textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    UserResponseData? user = ref.read(globalStateProvider).user;
    bool isOwner = user?.id == widget.story.id;

    if (widget.story.id == 'placeholder') {
      return buildPlaceholderStory();
    }

    return GestureDetector(
      onTap: navigateToStoryDetail,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: !isOwner && widget.story.hasPending
                      ? [
                          const Color.fromARGB(255, 249, 206, 52),
                          const Color.fromARGB(255, 238, 42, 123),
                          const Color.fromARGB(255, 98, 40, 215),
                        ]
                      : [
                          const Color.fromARGB(255, 176, 176, 176),
                          const Color.fromARGB(255, 199, 199, 199),
                        ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 35,
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: '$apiUrl/avatar/${widget.story.avatar}',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2.0),
            Text(
              isOwner ? 'Your Story' : widget.story.username,
              style: textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
