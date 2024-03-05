import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instagram_clone/config/assets.dart';
import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:instagram_clone/models/comment.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/state/post/comments_provider.dart';
import 'package:instagram_clone/state/global_state_provider.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:instagram_clone/widgets/core/clickable_list_item.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class CommentsModal extends ConsumerStatefulWidget {
  final String id;
  final PostUser user;
  final void Function(String comment) onComment;
  final void Function(String commentId) onCommentLike;
  final void Function(String commentId) onCommentUnLike;
  final void Function(String commentId) onCommentDelete;

  const CommentsModal({
    super.key,
    required this.id,
    required this.user,
    required this.onComment,
    required this.onCommentLike,
    required this.onCommentUnLike,
    required this.onCommentDelete,
  });

  @override
  ConsumerState<CommentsModal> createState() => _CommentsModalState();
}

class _CommentsModalState extends ConsumerState<CommentsModal> {
  final formKey = GlobalKey<FormState>();
  TextEditingController commentController = TextEditingController();

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
                Row(
                  children: [
                    Text(
                      item.user.username,
                      style: bodyLargeBold(context),
                    ),
                    const SizedBox(width: 6.0),
                    Text(
                      item.createdAt.toMoment().fromNow(
                            dropPrefixOrSuffix: true,
                            form: Abbreviation.full,
                          ),
                      style: textTheme.labelMedium,
                    ),
                  ],
                ),
                Text(
                  item.comment,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  softWrap: true,
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
                          AssetsConstants.unlike,
                          height: 18,
                          width: 18,
                        )
                      : SvgPicture.asset(
                          AssetsConstants.like,
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

  @override
  Widget build(BuildContext context) {
    UserResponseData? user = ref.read(globalStateProvider).user;

    return StatefulBuilder(
      builder: (context, setState) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Comments'),
            automaticallyImplyLeading: false,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
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
            provider: commentsProvider(widget.id),
            itemBuilder: (context, item, index) {
              return buildCommentItem(item, setState);
            },
            noItemsFoundIndicatorBuilder: (context, controller) {
              return const Center(child: Text('No Comments'));
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
  }
}
