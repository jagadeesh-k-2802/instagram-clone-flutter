import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:instagram_clone/utils/extensions.dart';
import 'package:instagram_clone/utils/stream_chat.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class PostShareModal extends StatefulWidget {
  final String postId;
  final String caption;
  final PostUser user;
  final String assetUrl;

  const PostShareModal({
    super.key,
    required this.postId,
    required this.caption,
    required this.user,
    required this.assetUrl,
  });

  @override
  State<PostShareModal> createState() => _PostShareModalState();
}

class _PostShareModalState extends State<PostShareModal> {
  StreamChatClient client = StreamChatSingleton.instance!.client;
  Set<Channel> selectedChannels = {};

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

  void addOrRemoveToSelectedChannels(Channel channel) {
    setState(() {
      if (selectedChannels.contains(channel)) {
        selectedChannels.remove(channel);
      } else {
        selectedChannels.add(channel);
      }
    });
  }

  Future<void> onPostShare() async {
    Message message = Message(
      text: '',
      attachments: [
        Attachment(
          type: 'post',
          title: 'Sent a post by ${widget.user.username}',
          text: '',
          uploadState: const UploadState.success(),
          extraData: {
            'postId': widget.postId,
            'url': widget.assetUrl,
            'caption': widget.caption.take(50),
          },
        )
      ],
    );

    await Future.forEach(
      selectedChannels,
      (Channel channel) async => await channel.sendMessage(message),
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Post has been shared')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Post'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(defaultPagePadding),
        child: ElevatedButton(
          onPressed: selectedChannels.isNotEmpty ? onPostShare : null,
          child: Text(
            'Share ${selectedChannels.isNotEmpty ? '(${selectedChannels.length})' : ''}',
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: StreamChat(
        client: client,
        child: StreamChannelGridView(
          controller: listController,
          gridDelegate: photoGridDelegate,
          onChannelTap: (_) {},
          emptyBuilder: (_) {
            return const Center(child: Text('No Messaging Users'));
          },
          errorBuilder: (_, __) {
            return const Center(child: Text('Something Went Wrong'));
          },
          loadingBuilder: (_) {
            return const Center(child: CircularProgressIndicator());
          },
          itemBuilder: (context, items, index, defaultWidget) {
            return GestureDetector(
              onTap: () => addOrRemoveToSelectedChannels(items[index]),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 38,
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: items[index]
                                      .extraData[client.state.currentUser!.id]
                                  as String,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        Text(
                          items[index].extraData[
                              '${client.state.currentUser!.id}-name'] as String,
                          style: bodyLargeBold(context),
                        ),
                      ],
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Icon(
                            selectedChannels.contains(items[index])
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                            color: selectedChannels.contains(items[index])
                                ? primaryColor
                                : Colors.transparent,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
