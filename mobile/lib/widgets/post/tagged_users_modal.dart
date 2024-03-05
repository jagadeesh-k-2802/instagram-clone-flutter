import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/theme/theme.dart';

class TaggedUsersModal extends StatefulWidget {
  final List<TaggedUserItem> taggedUsers;

  const TaggedUsersModal({
    super.key,
    required this.taggedUsers,
  });

  @override
  State<TaggedUsersModal> createState() => _TaggedUsersModalState();
}

class _TaggedUsersModalState extends State<TaggedUsersModal> {
  void openUserProfile(String userId) {
    // To dismiss modal
    Navigator.pop(context);
    context.push(Routes.publicProfilePath(userId));
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tagged in Post'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: widget.taggedUsers.length,
        itemBuilder: (context, index) {
          TaggedUserItem item = widget.taggedUsers[index];

          return InkWell(
            onTap: () => openUserProfile(item.id),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPagePadding,
                vertical: 2.0,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: '$apiUrl/avatar/${item.avatar}',
                      ),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Column(
                    children: [
                      Text(item.name, style: textTheme.bodyLarge),
                      Text(item.username, style: textTheme.bodyMedium),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
