import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/services/post.dart';
import 'package:instagram_clone/widgets/clickable_list_item.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class PostUploadScreen extends StatefulWidget {
  final Object? data;

  const PostUploadScreen({
    super.key,
    required this.data,
  });

  @override
  State<PostUploadScreen> createState() => _PostUploadScreenState();
}

class _PostUploadScreenState extends State<PostUploadScreen> {
  List<AssetEntity> assets = [];
  List<SearchUsersResponseData> selectedUsers = [];
  TextEditingController captionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.data is List<AssetEntity>) {
        setState(() {
          assets = widget.data as List<AssetEntity>;
        });
      } else {
        throw Exception(
          'PostUploadScreen: takes only List<AssetEntity> as param',
        );
      }
    });
  }

  void navigateToTagPeople() async {
    Object? users = await context.pushNamed('tag-people');

    if (users is List<SearchUsersResponseData>) {
      selectedUsers = users;
    }
  }

  Future<void> onPostShare() async {
    List<String> paths = [];

    for (AssetEntity asset in assets) {
      paths.add((await asset.file)?.path ?? '');
    }

    try {
      await PostService.createPost(
        caption: captionController.text,
        taggedUsers: selectedUsers.map((e) => e.id).toList(),
        localFilePaths: paths,
      );
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Post')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          onPressed: onPostShare,
          child: const Text('Share'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              width: double.maxFinite,
              child: PageView.builder(
                itemCount: assets.length,
                itemBuilder: (BuildContext context, int index) {
                  AssetEntity item = assets[index];
                  return AssetEntityImage(item, fit: BoxFit.fitHeight);
                },
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: captionController,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              maxLines: 3,
              maxLength: 250,
              decoration: const InputDecoration(
                hintText: 'Write a caption',
                border: InputBorder.none,
                filled: false,
                counterText: '',
              ),
            ),
            ClickableListItem(
              prefixIcon: Icons.account_circle_rounded,
              suffixIcon: Icons.chevron_right,
              text: selectedUsers.isEmpty
                  ? 'Tag People'
                  : selectedUsers.map((user) => user.name).join(','),
              onTap: navigateToTagPeople,
            ),
          ],
        ),
      ),
    );
  }
}
