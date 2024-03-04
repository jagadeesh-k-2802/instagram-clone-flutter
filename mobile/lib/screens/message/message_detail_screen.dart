import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/utils/stream_chat.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class MessageDetailScreen extends StatefulWidget {
  final String? channelId;

  const MessageDetailScreen({
    super.key,
    required this.channelId,
  });

  @override
  State<MessageDetailScreen> createState() => _MessageDetailScreenState();
}

class _MessageDetailScreenState extends State<MessageDetailScreen> {
  final client = StreamChatSingleton.instance!.client;
  late final channel = client.channel('messaging', id: widget.channelId);

  Widget buildPostMessageItem(MessageDetails details) {
    String? id = details.message.attachments.first.extraData['id'] as String?;
    String url = details.message.attachments.first.extraData['url'] as String;
    url = '$apiUrl/posts/$url';
    bool isOwner = details.message.user?.id == client.state.currentUser?.id;

    return InkWell(
      onTap: () => context.push(Routes.postDetailPath(id ?? '')),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment:
              isOwner ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            url.endsWith('.mp4')
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: url.replaceFirst('.mp4', '.jpg'),
                      fit: BoxFit.cover,
                      width: 250,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: url,
                      fit: BoxFit.cover,
                      width: 250,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return StreamChannel(
      channel: channel,
      child: StreamChat(
        client: client,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: channel.extraData[client.state.currentUser!.id]
                          as String,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      channel.extraData['${client.state.currentUser!.id}-name']
                          as String,
                      style: textTheme.titleMedium,
                    ),
                    StreamChannelInfo(
                      channel: channel,
                      textStyle: textTheme.bodySmall,
                    )
                  ],
                )
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: StreamMessageListView(
                  messageBuilder: (
                    context,
                    details,
                    messageList,
                    defaultImpl,
                  ) {
                    // Build Post Message
                    if (details.message.attachments.firstOrNull != null) {
                      if (details.message.attachments.first.type == 'post') {
                        return buildPostMessageItem(details);
                      }
                    }

                    return defaultImpl;
                  },
                ),
              ),
              const StreamMessageInput(
                showCommandsButton: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
