import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

  void navigateToTagPeople() {
    context.pushNamed('tag-people');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Post')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          onPressed: () {},
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

                  return AssetEntityImage(
                    item,
                    fit: BoxFit.fitHeight,
                  );
                },
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
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
              text: 'Tag People',
              onTap: navigateToTagPeople,
            ),
          ],
        ),
      ),
    );
  }
}
