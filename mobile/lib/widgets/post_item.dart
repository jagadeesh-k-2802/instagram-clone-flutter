import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:instagram_clone/models/comment.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/state/feed/comments_provider.dart';
import 'package:instagram_clone/state/global_state_provider.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:instagram_clone/utils/extensions.dart';
import 'package:instagram_clone/widgets/clickable_list_item.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class PostItem extends ConsumerStatefulWidget {
  final String id;
  final List<PostAssetItem> assets;
  final PostUser user;
  final String caption;
  final bool isLiked;
  final bool isSaved;
  final int likeCount;

  final void Function() onLike;
  final void Function() onUnLike;
  final void Function(String comment) onComment;
  final void Function() onShare;
  final void Function() onSave;
  final void Function() onUnsave;
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
    required this.onLike,
    required this.onUnLike,
    required this.onComment,
    required this.onShare,
    required this.onSave,
    required this.onUnsave,
    required this.onCommentLike,
    required this.onCommentUnLike,
    required this.onCommentDelete,
  });

  @override
  ConsumerState<PostItem> createState() => _PostItemState();
}

class _PostItemState extends ConsumerState<PostItem>
    with TickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();
  TextEditingController commentController = TextEditingController();
  bool showFullCaption = false;
  int selectedIndex = 0;
  bool isHeartVisible = false;
  Animation<double>? scale;

  void sendComment() {
    if (formKey.currentState?.validate() == true) {
      widget.onComment(commentController.text);
      commentController.text = '';
      setState(() {});
    }
  }

  Widget buildCommentItem(
    GetCommentsResponseData item,
    void Function(void Function()) localStateSetter,
  ) {
    final textTheme = Theme.of(context).textTheme;
    UserResponseData? user = ref.read(globalStateProvider).user;

    return GestureDetector(
      key: Key(item.id),
      onDoubleTap: () {
        if (!item.isLiked) {
          widget.onCommentLike(item.id);
        }
      },
      onLongPress: () {
        if (item.user.id == user?.id) {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                height: 80,
                width: double.maxFinite,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    ClickableListItem(
                      text: 'Delete Comment',
                      prefixIcon: Icons.delete,
                      textColor: Colors.red,
                      onTap: () {
                        localStateSetter(() {}); // To update the changes
                        widget.onCommentDelete(item.id);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: '$apiUrl/avatar/${item.user.avatar}',
                ),
              ),
            ),
            const SizedBox(width: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.user.username,
                  style: bodyLargeBold(context),
                ),
                Text(
                  item.comment,
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                GestureDetector(
                  onTap: item.isLiked
                      ? () => widget.onCommentUnLike(item.id)
                      : () => widget.onCommentLike(item.id),
                  child: item.isLiked
                      ? SvgPicture.asset(
                          'assets/icons/unlike.svg',
                          height: 18,
                          width: 18,
                        )
                      : SvgPicture.asset(
                          'assets/icons/like.svg',
                          height: 18,
                          width: 18,
                        ),
                ),
                Text(item.likeCount.toString()),
              ],
            )
          ],
        ),
      ),
    );
  }

  void showCommentsModal() {
    UserResponseData? user = ref.read(globalStateProvider).user;

    showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      context: context,
      constraints: const BoxConstraints(maxHeight: double.infinity),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Comments'),
                automaticallyImplyLeading: false,
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: '$apiUrl/avatar/${user?.avatar}',
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Form(
                        key: formKey,
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          controller: commentController,
                          textInputAction: TextInputAction.send,
                          onFieldSubmitted: (_) => sendComment,
                          onChanged: (_) => setState(() => {}),
                          decoration: InputDecoration(
                            hintText: 'comment for @${widget.user.username}',
                            filled: false,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: commentController.text.isNotEmpty,
                      child: GestureDetector(
                        onTap: sendComment,
                        child: Container(
                          height: 30,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              body: RiverPagedBuilder.autoDispose(
                firstPageKey: 1,
                limit: 20,
                provider: getCommentsProvider(widget.id),
                itemBuilder: (context, item, index) {
                  return buildCommentItem(item, setState);
                },
                noItemsFoundIndicatorBuilder: (context, controller) {
                  return const Center(
                    child: Text('No Comments'),
                  );
                },
                pagedBuilder: (controller, builder) => PagedListView.separated(
                  pagingController: controller,
                  builderDelegate: builder,
                  separatorBuilder: (context, index) => const Divider(),
                ),
              ),
            );
          },
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

    if (!widget.isLiked) {
      widget.onLike();
    }

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

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
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
                      onPageChanged: (int page) {
                        setState(() {
                          selectedIndex = page;
                        });
                      },
                      itemBuilder: (context, index) {
                        return CachedNetworkImage(
                          imageUrl: '$apiUrl/posts/${widget.assets[index].url}',
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),
                ),
              ),
              scale != null
                  ? AnimatedOpacity(
                      opacity: isHeartVisible ? 1 : 0,
                      duration: const Duration(milliseconds: 200),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: widget.isLiked ? widget.onUnLike : widget.onLike,
                  child: widget.isLiked
                      ? SvgPicture.asset(
                          'assets/icons/unlike.svg',
                          height: 28,
                          width: 28,
                        )
                      : SvgPicture.asset(
                          'assets/icons/like.svg',
                          height: 28,
                          width: 28,
                        ),
                ),
                const SizedBox(width: 16.0),
                GestureDetector(
                  onTap: showCommentsModal,
                  child: SvgPicture.asset(
                    'assets/icons/comment.svg',
                    height: 28,
                    width: 28,
                  ),
                ),
                const SizedBox(width: 16.0),
                GestureDetector(
                  onTap: widget.onShare,
                  child: SvgPicture.asset(
                    'assets/icons/share.svg',
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
                          'assets/icons/unsave.svg',
                          height: 28,
                          width: 28,
                        )
                      : SvgPicture.asset(
                          'assets/icons/save.svg',
                          height: 28,
                          width: 28,
                        ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 10.0,
            ),
            child: Text(
              '${widget.likeCount} likes',
              style: bodyLargeBold(context),
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
        ],
      ),
    );
  }
}
