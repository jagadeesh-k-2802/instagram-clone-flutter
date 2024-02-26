import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:instagram_clone/widgets/photo_grid.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class NewStoryScreen extends StatefulWidget {
  const NewStoryScreen({super.key});

  @override
  State<NewStoryScreen> createState() => _NewStoryScreenState();
}

class _NewStoryScreenState extends State<NewStoryScreen> {
  List<AssetEntity> localImages = [];
  AssetEntity? selectedImage;
  PermissionState permissionState = PermissionState.authorized;
  ScrollController outerController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await fetchAssets();
    });
  }

  Widget buildBottomBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Container(
        decoration: const BoxDecoration(
          color: lightGrayColor,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => context.pushReplacementNamed(Routes.newPost),
                child: Text(
                  'POST',
                  style: bodyLargeBold(context)?.copyWith(
                    color: Colors.black38,
                  ),
                ),
              ),
              Text(
                'STORY',
                style: bodyLargeBold(context)?.copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> fetchAssets({
    RequestType type = RequestType.image,
  }) async {
    await PhotoManager.clearFileCache();
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    Set<AssetEntity> results = {};

    final filter = AdvancedCustomFilter()
        .addOrderBy(column: CustomColumns.base.createDate, isAsc: false);

    if (ps.isAuth || ps.hasAccess) {
      final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
        filterOption: filter,
        type: type,
      );

      for (AssetPathEntity path in paths.reversed) {
        List<AssetEntity> assets = await path.getAssetListPaged(
          page: 0,
          size: 500,
        );

        for (AssetEntity asset in assets) {
          results.add(asset);
        }
      }
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enable photos permission')),
      );
    }

    if (results.isNotEmpty) {
      setState(() {
        localImages = results.toList();
        selectedImage = localImages[0];
        permissionState = ps;
      });
    }
  }

  void selectImage(int index) {
    // TODO: Upload Story Image/Video
  }

  Future<void> showPhotoSelector() async {
    await PhotoManager.presentLimited();
    await fetchAssets();
  }

  Widget buildTopBarItem({
    required String text,
    required IconData icon,
    required void Function() onTap,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon),
              const SizedBox(height: 8.0),
              Text(text, style: textTheme.bodyLarge)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTopBarItems() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        children: [
          buildTopBarItem(
            text: 'Camera',
            icon: Icons.camera,
            onTap: () => context.pushNamed(Routes.storyCapture),
          ),
          const SizedBox(width: 12.0),
          buildTopBarItem(
            text: 'Photos',
            icon: Icons.photo,
            onTap: () => fetchAssets(),
          ),
          const SizedBox(width: 12.0),
          buildTopBarItem(
            text: 'Videos',
            icon: Icons.play_circle_filled_rounded,
            onTap: () => fetchAssets(type: RequestType.video),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      floatingActionButton: buildBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: NestedScrollView(
        controller: outerController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () => (context.pop(context)),
                icon: const Icon(Icons.close, size: 30),
              ),
              title: const Text('New Story'),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(120),
                child: buildTopBarItems(),
              ),
            )
          ];
        },
        body: ListView(
          shrinkWrap: true,
          children: [
            Visibility(
              visible: permissionState == PermissionState.limited,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  bottom: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'You\'ve given Instagram access to a\nselect number of photos and videos',
                      style: textTheme.labelLarge,
                    ),
                    TextButton(
                      onPressed: showPhotoSelector,
                      child: const Text('Manage'),
                    ),
                  ],
                ),
              ),
            ),
            PhotoGrid(
              itemCount: localImages.length,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () => selectImage(index),
                        child: AssetEntityImage(
                          key: Key(localImages[index].id),
                          localImages[index],
                          thumbnailFormat: ThumbnailFormat.jpeg,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
