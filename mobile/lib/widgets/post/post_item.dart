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
import 'package:instagram_clone/widgets/post/video_item.dart';

class PostItem extends ConsumerStatefulWidget {
  final String id;
  final List<PostAssetItem> assets;
  final PostUser user;
  final String caption;
  final bool isLiked;
  final bool isSaved;
  final int likeCount;
  final int commentCount;

  final void Function() onLike;
  final void Function() onUnLike;
  final void Function(String comment) onComment;
  final void Function() onShare;
  final void Function() onSave;
  final void Function() onUnsave;
  final void Function() onDelete;
  final void Function(String commentId) onCommentLike;
  final void Function(String commentId) onCommentUnLike;
  final void Function(String commentId) onCommentDelete;

  const PostItem({
    super.key,
    required this.id,
    required this.assets,
    required this.user,
    required this.caption,
    required this.isLiked,
    required this.isSaved,
    required this.likeCount,
    required this.commentCount,
    required this.onLike,
    required this.onUnLike,
    required this.onComment,
    required this.onShare,
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

class _PostItemState extends ConsumerState<PostItem> with TickerProviderStateMixin {
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
      context: context,
      constraints: const BoxConstraints(maxHeight: double.infinity),
      builder: (context) {
        return CommentsModal(
          id: widget.id,
          user: widget.user,
          onComment: widget.onComment,
          onCommentLike: widget.onCommentLike,
          onCommentUnLike: widget.onCommentUnLike,
          onCommentDelete: widget.onCommentDelete,
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
    if (!widget.isLiked) widget.onLike();
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

    for (int i = 0; i < widget.assets.length; i++) {
      list.add(
        i == selectedIndex ? pageIndicator(true) : pageIndicator(false),
      );
    }

    return list;
  }

  void navigateToLikedDetail() {
    context.push(Routes.postLikeDetailPath(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    UserResponseData? user = ref.read(globalStateProvider).user;
    bool isOwner = user?.id == widget.user.id;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => openUserProfile(widget.user.id, isOwner),
            child: Row(
              children: [
                const SizedBox(width: 12.0),
                CircleAvatar(
                  radius: 22.0,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: '$apiUrl/avatar/${widget.user.avatar}',
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Text(widget.user.username, style: bodyLargeBold(context)),
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
                      itemCount: widget.assets.length,
                      restorationId: widget.id + widget.user.id,
                      onPageChanged: (int page) {
                        setState(() => selectedIndex = page);
                      },
                      itemBuilder: (context, index) {
                        PostAssetItem item = widget.assets[index];

                        if (item.assetType == 'video') {
                          return VideoItem(
                            isLocal: false,
                            networkUrl: '$apiUrl/posts/${item.url}',
                          );
                        }

                        return CachedNetworkImage(
                          imageUrl: '$apiUrl/posts/${item.url}',
                          fit: BoxFit.cover,
                        );
                      },
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
                  onTap: widget.isLiked ? widget.onUnLike : widget.onLike,
                  child: widget.isLiked
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
                  onTap: widget.onShare,
                  child: SvgPicture.asset(
                    AssetsConstants.share,
                    height: 28,
                    width: 28,
                  ),
                ),
                Visibility(
                  visible: widget.assets.length > 1,
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
                  onTap: widget.isSaved ? widget.onUnsave : widget.onSave,
                  child: widget.isSaved
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
                '${widget.likeCount} like${widget.likeCount > 1 ? 's' : ''}',
                style: bodyLargeBold(context),
              ),
            ),
          ),
          Visibility(
            visible: widget.caption.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: showFullCaption
                  ? RichText(
                      text: TextSpan(
                        text: "${widget.user.username} ",
                        style: bodyLargeBold(context),
                        children: [
                          TextSpan(
                            text: widget.caption,
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
                                text: "${widget.user.username} ",
                                style: bodyLargeBold(context),
                              ),
                              TextSpan(
                                text: widget.caption.take(80),
                                style: textTheme.bodyMedium,
                              ),
                              widget.caption.length > 80
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
              visible: widget.commentCount > 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 2.0,
                ),
                child: Text(
                  'View all ${widget.commentCount} comment${widget.commentCount > 1 ? 's' : ''}',
                  style: textTheme.labelLarge?.copyWith(color: Colors.black45),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
