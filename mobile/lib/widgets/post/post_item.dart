import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/config/assets.dart';
import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/state/global_state_provider.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:instagram_clone/utils/extensions.dart';
import 'package:instagram_clone/widgets/core/clickable_list_item.dart';
import 'package:instagram_clone/widgets/post/comments_modal.dart';
import 'package:instagram_clone/widgets/post/post_share_modal.dart';
import 'package:instagram_clone/widgets/post/tagged_users_modal.dart';
import 'package:instagram_clone/widgets/post/video_item.dart';
import 'package:moment_dart/moment_dart.dart';

class PostItem extends ConsumerStatefulWidget {
  final GetFeedPostsResponseData item;
  final void Function() onLike;
  final void Function() onUnLike;
  final void Function(String comment) onComment;
  final void Function() onSave;
  final void Function() onUnsave;
  final void Function() onDelete;
  final void Function(String commentId) onCommentLike;
  final void Function(String commentId) onCommentUnLike;
  final void Function(String commentId) onCommentDelete;

  const PostItem({
    super.key,
    required this.item,
    required this.onLike,
    required this.onUnLike,
    required this.onComment,
    required this.onSave,
    required this.onUnsave,
    required this.onDelete,
    required this.onCommentLike,
    required this.onCommentUnLike,
    required this.onCommentDelete,
  });

  @override
  ConsumerState<PostItem> createState() => _PostItemState();
}

class _PostItemState extends ConsumerState<PostItem>
    with TickerProviderStateMixin {
  bool showFullCaption = false;
  int selectedIndex = 0;
  bool isHeartVisible = false;
  Animation<double>? scale;

  void showPostActionsModal() {
    showModalBottomSheet(
      showDragHandle: true,
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              height: 80,
              width: double.maxFinite,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  ClickableListItem(
                    text: 'Delete Post',
                    prefixIcon: Icons.delete,
                    textColor: Colors.red,
                    onTap: () {
                      widget.onDelete();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void openUserProfile(String userId, bool isOwner) {
    if (isOwner) {
      context.pushNamed(Routes.profile);
    } else {
      context.push(Routes.publicProfilePath(userId));
    }
  }

  void showCommentsModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      useRootNavigator: true,
      context: context,
      constraints: const BoxConstraints(maxHeight: double.infinity),
      builder: (context) {
        return CommentsModal(
          id: widget.item.id,
          user: widget.item.user,
          onComment: widget.onComment,
          onCommentLike: widget.onCommentLike,
          onCommentUnLike: widget.onCommentUnLike,
          onCommentDelete: widget.onCommentDelete,
        );
      },
    );
  }

  void showPostShareModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      useRootNavigator: true,
      useSafeArea: true,
      context: context,
      constraints: const BoxConstraints(maxHeight: double.infinity),
      builder: (context) {
        return PostShareModal(
          postId: widget.item.id,
          user: widget.item.user,
          caption: widget.item.caption,
          assetUrl: widget.item.assets[0].url,
        );
      },
    );
  }

  void showTaggedUsersModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      useRootNavigator: true,
      useSafeArea: true,
      context: context,
      constraints: const BoxConstraints(maxHeight: double.infinity),
      builder: (context) {
        return TaggedUsersModal(
          taggedUsers: widget.item.taggedUsers,
        );
      },
    );
  }

  void likeWithHeartAnimation() async {
    final controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    scale = Tween<double>(begin: 1, end: 1.2).animate(controller);
    if (isHeartVisible || !mounted) return;
    setState(() => isHeartVisible = true);
    if (!widget.item.isLiked) widget.onLike();
    await controller.forward();
    await controller.reverse();

    Future.delayed(const Duration(milliseconds: 300), () {
      if (!mounted) return;

      setState(() {
        isHeartVisible = false;
        scale = null;
      });
    });
  }

  Widget pageIndicator(bool isActive) {
    return SizedBox(
      height: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? primaryColor : const Color(0XFFEAEAEA),
        ),
      ),
    );
  }

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];

    for (int i = 0; i < widget.item.assets.length; i++) {
      list.add(
        i == selectedIndex ? pageIndicator(true) : pageIndicator(false),
      );
    }

    return list;
  }

  void navigateToLikedDetail() {
    context.push(Routes.postLikeDetailPath(widget.item.id));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    UserResponseData? user = ref.read(globalStateProvider).user;
    bool isOwner = user?.id == widget.item.user.id;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => openUserProfile(widget.item.user.id, isOwner),
            child: Row(
              children: [
                const SizedBox(width: 12.0),
                CircleAvatar(
                  radius: 22.0,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: '$apiUrl/avatar/${widget.item.user.avatar}',
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Text(widget.item.user.username, style: bodyLargeBold(context)),
                const Spacer(),
                Visibility(
                  visible: isOwner,
                  child: IconButton(
                    onPressed: showPostActionsModal,
                    icon: const Icon(Icons.more_vert),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 4.0),
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: GestureDetector(
                  onDoubleTap: likeWithHeartAnimation,
                  child: SizedBox(
                    height: 250,
                    width: double.maxFinite,
                    child: PageView.builder(
                      itemCount: widget.item.assets.length,
                      restorationId: widget.item.id + widget.item.user.id,
                      onPageChanged: (int page) {
                        setState(() => selectedIndex = page);
                      },
                      itemBuilder: (context, index) {
                        PostAssetItem item = widget.item.assets[index];

                        if (item.assetType == 'video') {
                          return VideoItem(
                            isLocal: false,
                            networkUrl: '$apiUrl/posts/${item.url}',
                          );
                        }

                        return InteractiveViewer(
                          child: CachedNetworkImage(
                            imageUrl: '$apiUrl/posts/${item.url}',
                            fit: BoxFit.cover,
                            errorWidget: (_, __, ___) {
                              return Center(
                                child: Text(
                                  'Something went wrong',
                                  style: textTheme.bodyLarge,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Visibility(
                  visible: widget.item.taggedUsers.isNotEmpty,
                  child: GestureDetector(
                    onTap: showTaggedUsersModal,
                    child: const Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 14,
                        ),
                        child: Icon(
                          Icons.account_circle,
                          color: lightGrayColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              scale != null
                  ? AnimatedOpacity(
                      opacity: isHeartVisible ? 1 : 0,
                      duration: const Duration(milliseconds: 500),
                      child: ScaleTransition(
                        scale: scale!,
                        child: const Icon(
                          Icons.favorite,
                          size: 120,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
          const SizedBox(height: 4.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: widget.item.isLiked ? widget.onUnLike : widget.onLike,
                  child: widget.item.isLiked
                      ? SvgPicture.asset(
                          AssetsConstants.unlike,
                          height: 28,
                          width: 28,
                        )
                      : SvgPicture.asset(
                          AssetsConstants.like,
                          height: 28,
                          width: 28,
                        ),
                ),
                const SizedBox(width: 16.0),
                GestureDetector(
                  onTap: showCommentsModal,
                  child: SvgPicture.asset(
                    AssetsConstants.comment,
                    height: 28,
                    width: 28,
                  ),
                ),
                const SizedBox(width: 16.0),
                GestureDetector(
                  onTap: showPostShareModal,
                  child: SvgPicture.asset(
                    AssetsConstants.share,
                    height: 28,
                    width: 28,
                  ),
                ),
                Visibility(
                  visible: widget.item.assets.length > 1,
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 12.0),
                        ...buildPageIndicator(),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: widget.item.isSaved ? widget.onUnsave : widget.onSave,
                  child: widget.item.isSaved
                      ? SvgPicture.asset(
                          AssetsConstants.unsave,
                          height: 28,
                          width: 28,
                        )
                      : SvgPicture.asset(
                          AssetsConstants.save,
                          height: 28,
                          width: 28,
                        ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: navigateToLikedDetail,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              child: Text(
                '${widget.item.likeCount} like${widget.item.likeCount > 1 ? 's' : ''}',
                style: bodyLargeBold(context),
              ),
            ),
          ),
          Visibility(
            visible: widget.item.caption.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: showFullCaption
                  ? RichText(
                      text: TextSpan(
                        text: "${widget.item.user.username} ",
                        style: bodyLargeBold(context),
                        children: [
                          TextSpan(
                            text: widget.item.caption.trim(),
                            style: textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    )
                  : Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "${widget.item.user.username} ",
                                style: bodyLargeBold(context),
                              ),
                              TextSpan(
                                text: widget.item.caption.take(80).trim(),
                                style: textTheme.bodyMedium,
                              ),
                              widget.item.caption.length > 80
                                  ? TextSpan(
                                      text: ' ... more',
                                      style: textTheme.bodyMedium?.copyWith(
                                        color: Colors.black45,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => setState(
                                              () => showFullCaption = true,
                                            ),
                                    )
                                  : const TextSpan()
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          GestureDetector(
            onTap: showCommentsModal,
            child: Visibility(
              visible: widget.item.commentCount > 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 2.0,
                ),
                child: Text(
                  'View all ${widget.item.commentCount} comment${widget.item.commentCount > 1 ? 's' : ''}',
                  style: textTheme.labelLarge?.copyWith(color: Colors.black45),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 2.0,
            ),
            child: Text(
              widget.item.createdAt.toMoment().fromNow(),
              style: textTheme.labelMedium?.copyWith(color: Colors.black45),
            ),
          ),
        ],
      ),
    );
  }
}
