import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:instagram_clone/models/story.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/services/story.dart';
import 'package:instagram_clone/state/global_state_provider.dart';
import 'package:instagram_clone/state/story/feed_stories_provider.dart';
import 'package:instagram_clone/state/story/story_viewers_provider.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:instagram_clone/widgets/core/clickable_list_item.dart';
import 'package:instagram_clone/widgets/story/instagram_story_swipe.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

const int _storySeconds = 5;

class StoryDetailScreenArgs {
  final int initialIndex;
  final List<GetFeedStoriesResponseData>? storiesList;

  const StoryDetailScreenArgs({
    required this.initialIndex,
    required this.storiesList,
  });
}

class StoryDetailScreen extends ConsumerStatefulWidget {
  final Object? args;

  const StoryDetailScreen({
    super.key,
    required this.args,
  });

  @override
  ConsumerState<StoryDetailScreen> createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends ConsumerState<StoryDetailScreen> {
  int currentPage = 0;
  int currentIndex = 0;
  double currentTime = 0;
  bool pauseTimer = false;
  Timer? timer;
  InstagramSwipeController? instagramSwipeController;
  List<GetFeedStoriesResponseData>? storiesList = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.args is StoryDetailScreenArgs) {
        final args = widget.args as StoryDetailScreenArgs;
        currentPage = args.initialIndex;
        storiesList = args.storiesList;
        final story = storiesList?[args.initialIndex];

        timer = Timer.periodic(
          const Duration(milliseconds: 200),
          timerCallback,
        );

        instagramSwipeController = InstagramSwipeController(
          pageController: PageController(initialPage: args.initialIndex),
        );

        if (story?.hasPending == true) {
          for (int i = 0; i < story!.stories.length; i++) {
            if (!story.stories[i].isViewed == true) {
              currentIndex = i;
              break;
            }
          }
        }

        await viewStory();
      } else {
        throw Exception(
          'StoryDetailScreen: takes only StoryDetailScreenArgs as param',
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  Future<void> viewStory() async {
    final story = storiesList?[currentPage];

    if (currentIndex >= story!.stories.length) {
      return;
    }

    String userId = story.id;
    String storyId = story.stories[currentIndex].id;

    try {
      await StoryService.viewStory(storyId: storyId);
      ref.read(feedStoriesProvider.notifier).viewStory(userId, storyId);
    } catch (error) {
      // Do Nothing
    }
  }

  void timerCallback(Timer t) {
    final story = storiesList?[currentPage];

    if (!pauseTimer) {
      setState(() => currentTime += 0.2);
    }

    if (currentTime.toInt() == _storySeconds) {
      setState(() => currentTime = 0);

      if (currentIndex < (story?.stories.length ?? 0) - 1) {
        setState(() => currentIndex++);
        viewStory();
      } else {
        if (currentPage == (storiesList?.length ?? 0) - 1) {
          context.pop();
        } else {
          instagramSwipeController?.nextPage();
        }
      }
    }
  }

  void onStoryTapDown(TapDownDetails details, BoxConstraints constraints) {
    bool isLeft = details.globalPosition.dx < constraints.maxWidth / 2;
    final story = storiesList?[currentPage];

    if (isLeft) {
      currentIndex -= 1;

      if (currentPage == 0) {
        if (currentIndex < 0) context.pop();
      } else {
        currentIndex = 0;
        instagramSwipeController?.previousPage();
      }

      setState(() => currentTime = 0);
    } else {
      currentIndex += 1;

      // If last page and last story then pop
      if (currentPage == (storiesList?.length ?? 0) - 1) {
        if (currentIndex > (story?.stories.length ?? 0) - 1) {
          context.pop();
        }
      } else {
        // If last story item move to next page
        if (currentIndex > (story?.stories.length ?? 0) - 1) {
          currentIndex = 0;
          instagramSwipeController?.nextPage();
        }
      }

      viewStory();
      setState(() => currentTime = 0);
    }
  }

  List<Widget> buildProgressBars() {
    List<Widget> output = [];
    final story = storiesList?[currentPage];

    story?.stories.indexed.forEach((element) {
      var (index, _) = element;
      bool currentItem = index == currentIndex;

      output.add(
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: TweenAnimationBuilder<double>(
              duration: Duration(milliseconds: currentTime == 0 ? 0 : 250),
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

  void removeStoryFromLocalState(String storyId) {
    final story = storiesList?[currentPage];
    List<StoryItem>? newStoriesList = List.from(story?.stories ?? []);
    newStoriesList.removeWhere((story) => story.id == storyId);
    if (story == null) return;

    storiesList = storiesList
        ?.map(
          (e) => e.id == story.id ? story.copyWith(stories: newStoriesList) : e,
        )
        .toList();

    // If it is last story then pop
    if (newStoriesList.isEmpty == true) {
      context.pop();
      return;
    }

    setState(() {
      currentIndex = 0;
    });
  }

  Future<void> onStoryDelete() async {
    final story = storiesList?[currentPage];
    String userId = story?.id ?? '';
    String storyId = story?.stories[currentIndex].id ?? '';

    try {
      ref.read(feedStoriesProvider.notifier).deleteStory(userId, storyId);
      removeStoryFromLocalState(storyId);
      Navigator.pop(context);
      await StoryService.deleteStory(storyId: storyId);
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Your Story has been deleted')),
      );
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  Widget buildStoryViewerItem(GetStoryViewersResponseData item) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPagePadding,
          vertical: 2.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 28.0,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: '$apiUrl/avatar/${item.avatar}',
                ),
              ),
            ),
            const SizedBox(width: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(item.name, style: textTheme.bodyLarge),
                Text(item.username, style: textTheme.bodyMedium),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showStoryViewers(String storyId) async {
    setState(() => pauseTimer = true);

    await showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      context: context,
      constraints: const BoxConstraints(maxHeight: double.infinity),
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Viewers'),
            automaticallyImplyLeading: false,
            centerTitle: true,
          ),
          body: RiverPagedBuilder.autoDispose(
            firstPageKey: 1,
            provider: storyViewersProvider(storyId),
            itemBuilder: (context, item, index) {
              return buildStoryViewerItem(item);
            },
            noItemsFoundIndicatorBuilder: (context, controller) {
              return const Center(
                child: Text('No Viewers Yet'),
              );
            },
            pagedBuilder: (controller, builder) => PagedListView.separated(
              pagingController: controller,
              builderDelegate: builder,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, __) => const Divider(),
            ),
          ),
        );
      },
    );

    setState(() => pauseTimer = false);
  }

  Future<void> showMoreBottomSheet() async {
    setState(() => pauseTimer = true);

    await showModalBottomSheet(
      showDragHandle: true,
      useRootNavigator: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 80,
          width: double.maxFinite,
          child: Column(
            children: [
              ClickableListItem(
                text: 'Delete',
                prefixIcon: Icons.delete,
                textColor: Colors.red,
                onTap: onStoryDelete,
              ),
            ],
          ),
        );
      },
    );

    setState(() => pauseTimer = false);
  }

  void navigateToUserProfile(String userId) {
    context.push(Routes.publicProfilePath(userId));
  }

  Widget buildStoryDetail() {
    TextTheme textTheme = Theme.of(context).textTheme;
    UserResponseData? userData = ref.read(globalStateProvider).user;
    final storyData = storiesList?[currentPage];
    StoryItem? storyItem = storyData?.stories[currentIndex];
    bool isOwner = userData?.id == storyData?.id;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
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
                        fit: BoxFit.cover,
                        errorWidget: (_, __, ___) {
                          return Center(
                            child: Text(
                              'Something went wrong',
                              style: textTheme.bodyLarge?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
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
                                imageUrl: '$apiUrl/avatar/${storyData?.avatar}',
                              ),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Text(
                            storyData?.username ?? '',
                            style: bodyLargeBold(context)?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            storyItem?.createdAt.toMoment().fromNow(
                                      dropPrefixOrSuffix: true,
                                      form: Abbreviation.full,
                                    ) ??
                                '',
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
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Visibility(
                        visible: isOwner,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => showStoryViewers(
                                storyItem?.id ?? '',
                              ),
                              child: Text(
                                '${storyItem?.viewCount} Viewers',
                                style: bodyLargeBold(context)?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: showMoreBottomSheet,
                              icon: const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: buildProgressBars(),
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

  void onPageChanged(int index) {
    setState(() {
      currentTime = 0;
      currentIndex = 0;
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = widget.args as StoryDetailScreenArgs;

    if (instagramSwipeController == null) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return InstagramStorySwipe(
      initialPage: args.initialIndex,
      instagramSwipeController: instagramSwipeController!,
      onPageChanged: onPageChanged,
      children: args.storiesList
              ?.map(
                (_) => buildStoryDetail(),
              )
              .toList() ??
          [],
    );
  }
}
