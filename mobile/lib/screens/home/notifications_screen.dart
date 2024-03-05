import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/models/notification.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/services/user.dart';
import 'package:instagram_clone/state/global_state_provider.dart';
import 'package:instagram_clone/state/notification/notification_provider.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';
import 'package:visibility_detector/visibility_detector.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  void openUserProfile(String? userId) {
    if (userId != null) {
      context.push(Routes.publicProfilePath(userId));
    }
  }

  void openPostDetail(String? postId) {
    if (postId != null) {
      context.push(Routes.postDetailPath(postId));
    }
  }

  Widget buildInfoType(GetNotificationsResponseData data) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPagePadding,
        vertical: 4.0,
      ),
      child: GestureDetector(
        onTap: () => data.data?.post != null
            ? openPostDetail(data.data?.post)
            : openUserProfile(data.data?.user?.id),
        child: Row(
          children: [
            Visibility(
              visible: data.data?.user != null,
              child: CircleAvatar(
                radius: 26.0,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: '$apiUrl/avatar/${data.data?.user?.avatar}',
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Text(
                          data.content,
                          style: textTheme.bodyMedium,
                          maxLines: 5,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        data.createdAt.toMoment().fromNow(
                              form: Abbreviation.full,
                              dropPrefixOrSuffix: true,
                            ),
                        style: textTheme.labelMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFollowRequestType(GetNotificationsResponseData data) {
    TextTheme textTheme = Theme.of(context).textTheme;

    Future<void> onConfirm() async {
      try {
        await UserService.acceptFollowRequest(notificationId: data.id);
        ref.read(globalStateProvider.notifier).incrementFollowersCount();
        ref.read(notificationsProvider.notifier).invalidate();
      } catch (error) {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      }
    }

    Future<void> onDelete() async {
      try {
        await UserService.deleteFollowRequest(notificationId: data.id);
        ref.read(notificationsProvider.notifier).invalidate();
      } catch (error) {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPagePadding,
        vertical: 4.0,
      ),
      child: GestureDetector(
        onTap: () => openUserProfile(data.data?.user?.id),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26.0,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: '$apiUrl/avatar/${data.data?.user?.avatar}',
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(data.content, style: textTheme.bodyMedium),
                      Text(
                        data.createdAt.toMoment().fromNow(
                              form: Abbreviation.full,
                              dropPrefixOrSuffix: true,
                            ),
                        style: textTheme.labelMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 32,
                        child: ElevatedButton(
                          onPressed: onConfirm,
                          child: const Text('Confirm'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 120,
                        height: 32,
                        child: ElevatedButton(
                          onPressed: onDelete,
                          style: secondaryButtonStyle,
                          child: const Text('Delete'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNotificationItem(GetNotificationsResponseData data) {
    switch (data.type) {
      case NotificationType.followRequest:
        return buildFollowRequestType(data);
      case NotificationType.info:
        return buildInfoType(data);
      default:
        throw Exception(
          'NotifcationsScreen: invalid notification type ${data.type}',
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('NotificationsScreen'),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;

        if (visiblePercentage == 100 && mounted) {
          ref.read(globalStateProvider.notifier).readNotifications();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
          automaticallyImplyLeading: false,
        ),
        body: RiverPagedBuilder.autoDispose(
          firstPageKey: 1,
          limit: 20,
          pullToRefresh: true,
          provider: notificationsProvider,
          itemBuilder: (context, item, index) => buildNotificationItem(item),
          noItemsFoundIndicatorBuilder: (context, controller) {
            return const Center(child: Text('No Notifications'));
          },
          pagedBuilder: (controller, builder) => PagedListView.separated(
            pagingController: controller,
            builderDelegate: builder,
            separatorBuilder: (context, index) => const Divider(),
          ),
        ),
      ),
    );
  }
}
