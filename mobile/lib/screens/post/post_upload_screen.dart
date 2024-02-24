import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/services/post.dart';
import 'package:instagram_clone/state/global_state.dart';
import 'package:instagram_clone/state/profile/user_posts_state.dart';
import 'package:instagram_clone/widgets/clickable_list_item.dart';
import 'package:instagram_clone/widgets/progress_button.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class PostUploadScreen extends ConsumerStatefulWidget {
  final Object? data;

  const PostUploadScreen({
    super.key,
    required this.data,
  });

  @override
  ConsumerState<PostUploadScreen> createState() => _PostUploadScreenState();
}

class _PostUploadScreenState extends ConsumerState<PostUploadScreen> {
  List<AssetEntity> assets = [];
  List<SearchUsersResponseData> selectedUsers = [];
  bool submitting = false;
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
    setState(() => submitting = true);
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

      if (!mounted) return;
      context.goNamed('feed');

      ref.read(globalStateProvider.notifier).incrementPostCount();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Your post has been uploaded')),
      );
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    } finally {
      ref.read(userPostsProvider.notifier).invalidate();
      setState(() => submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Post')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ProgressButton(
          inProgress: submitting,
          onTap: onPostShare,
          text: 'Share',
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
