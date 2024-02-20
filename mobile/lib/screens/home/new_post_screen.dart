import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:instagram_clone/widgets/photo_grid.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  int activeScreen = 0;
  List<AssetEntity> localImages = [];
  AssetEntity? selectedImage;
  PermissionState permissionState = PermissionState.authorized;
  ScrollController outerController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await fetchPhotos();
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
                onTap: () => setState(() => (activeScreen = 0)),
                child: Text(
                  'POST',
                  style: bodyLargeBold(context)?.copyWith(
                    color: activeScreen == 0 ? Colors.black : Colors.black38,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => (activeScreen = 1)),
                child: Text(
                  'STORY',
                  style: bodyLargeBold(context)?.copyWith(
                    color: activeScreen == 1 ? Colors.black : Colors.black38,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> fetchPhotos() async {
    await PhotoManager.clearFileCache();
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    List<AssetEntity> results = [];

    if (ps.isAuth || ps.hasAccess) {
      final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList();

      for (AssetPathEntity path in paths.sublist(1).reversed) {
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
        localImages = results;
        selectedImage = results[0];
        permissionState = ps;
      });
    }
  }

  void selectImage(int index) {
    setState(() => selectedImage = localImages[index]);

    outerController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  Future<void> showPhotoSelector() async {
    await PhotoManager.presentLimited();
    await fetchPhotos();
  }

  void onPhotoSelected() {
    if (selectedImage == null) return;
    // TODO: Upload Photo/Video by showing another screen
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
              title: const Text('New Post'),
              actions: [
                TextButton(
                  onPressed: onPhotoSelected,
                  child: Text(
                    'Next',
                    style: bodyLargeBold(context)?.copyWith(
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(250),
                child: selectedImage != null
                    ? SizedBox(
                        height: 250,
                        child: AssetEntityImage(
                          selectedImage!,
                          isOriginal: false,
                          thumbnailFormat: ThumbnailFormat.jpeg,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(),
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
                return GestureDetector(
                  onTap: () => selectImage(index),
                  child: AssetEntityImage(
                    key: Key(localImages[index].id),
                    localImages[index],
                    isOriginal: false,
                    thumbnailFormat: ThumbnailFormat.jpeg,
                    fit: BoxFit.cover,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
