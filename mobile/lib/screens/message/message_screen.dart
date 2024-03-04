import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:instagram_clone/utils/stream_chat.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  StreamChatClient client = StreamChatSingleton.instance!.client;

  late final listController = StreamChannelListController(
    client: client,
    filter: Filter.in_('members', [client.state.currentUser!.id]),
    limit: 20,
    presence: true,
  );

  @override
  void dispose() {
    listController.dispose();
    super.dispose();
  }

  void onChannelTap(Channel channel) {
    context.push(Routes.messageDetailPath(channel.id ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Messages')),
      body: StreamChat(
        client: client,
        child: StreamChannelListView(
          controller: listController,
          onChannelTap: onChannelTap,
          restorationId: 'messages-list',
          emptyBuilder: (_) {
            return const Center(child: Text('No Messages Yet'));
          },
          errorBuilder: (_, __) {
            return const Center(child: Text('Something Went Wrong'));
          },
          loadingBuilder: (_) {
            return const Center(child: CircularProgressIndicator());
          },
          itemBuilder: (context, items, index, defaultWidget) {
            return defaultWidget.copyWith(
              unreadIndicatorBuilder: (context) {
                return BetterStreamBuilder<int>(
                  stream: items[index].state?.unreadCountStream,
                  initialData: items[index].state?.unreadCount,
                  builder: (context, count) {
                    if (count == 0) return const Offstage();

                    return Container(
                      height: 7.5,
                      width: 7.5,
                      decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(100.0),
                        ),
                      ),
                    );
                  },
                );
              },
              contentPadding: const EdgeInsets.symmetric(
                horizontal: defaultPagePadding,
                vertical: 5.0,
              ),
              leading: CircleAvatar(
                radius: 24,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: items[index]
                        .extraData[client.state.currentUser!.id] as String,
                  ),
                ),
              ),
              title: Text(
                items[index].extraData['${client.state.currentUser!.id}-name']
                    as String,
                style: bodyLargeBold(context),
              ),
              subtitle: SizedBox(
                width: 250,
                child: StreamTypingIndicator(
                  channel: items[index],
                  alternativeWidget: ChannelLastMessageText(
                    channel: items[index],
                    textStyle: textTheme.bodyMedium,
                  ),
                ),
              ),
              trailing: Text(
                items[index].lastMessageAt?.toMoment().fromNow(
                          dropPrefixOrSuffix: true,
                          form: Abbreviation.full,
                        ) ??
                    '',
                style: textTheme.labelMedium,
              ),
            );
          },
        ),
      ),
    );
  }
}
