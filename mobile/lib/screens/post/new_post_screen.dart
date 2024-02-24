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
  List<AssetEntity> localImages = [];
  AssetEntity? selectedImage;
  PermissionState permissionState = PermissionState.authorized;
  ScrollController outerController = ScrollController();
  List<AssetEntity> selectImages = [];

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
              Text(
                'POST',
                style: bodyLargeBold(context)?.copyWith(color: Colors.black),
              ),
              GestureDetector(
                onTap: () => context.pushReplacementNamed('new-story'),
                child: Text(
                  'STORY',
                  style: bodyLargeBold(context)?.copyWith(
                    color: Colors.black38,
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
    Set<AssetEntity> results = {};

    final filter = AdvancedCustomFilter()
        .addOrderBy(column: CustomColumns.base.createDate, isAsc: false);

    if (ps.isAuth || ps.hasAccess) {
      final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
        filterOption: filter,
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
    setState(() => selectedImage = localImages[index]);

    outerController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  void addToSelectedPhotos(int index) {
    setState(() {
      if (selectImages.contains(localImages[index])) {
        selectImages.remove(localImages[index]);
      } else {
        if (selectImages.length >= 5) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Cannot select more than 5 items')),
          );
          return;
        }

        selectImages.add(localImages[index]);
      }
    });
  }

  Future<void> showPhotoSelector() async {
    await PhotoManager.presentLimited();
    await fetchPhotos();
  }

  Future<void> onPostUpload() async {
    if (selectedImage == null) return;

    List<AssetEntity> data = [];

    if (selectImages.isEmpty) {
      data = [selectedImage!];
    } else {
      data = selectImages.toList();
    }

    context.pushNamed('post-upload', extra: data);
  }

  Widget buildGalleryItem(AssetEntity item, int index) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: () => selectImage(index),
            onLongPress: () => addToSelectedPhotos(index),
            child: AssetEntityImage(
              key: Key(localImages[index].id),
              item,
              isOriginal: false,
              thumbnailFormat: ThumbnailFormat.jpeg,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Visibility(
          visible: item.type == AssetType.video,
          child: const Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(
                  Icons.videocam_sharp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: GestureDetector(
            onTap: () => addToSelectedPhotos(index),
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Icon(
                  selectImages.contains(item)
                      ? Icons.check_circle
                      : Icons.circle_outlined,
                  color:
                      selectImages.contains(item) ? primaryColor : Colors.white,
                  size: 30.0,
                ),
              ),
            ),
          ),
        ),
      ],
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
              title: const Text('New Post'),
              actions: [
                TextButton(
                  onPressed: onPostUpload,
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
                AssetEntity item = localImages[index];
                return buildGalleryItem(item, index);
              },
            )
          ],
        ),
      ),
    );
  }
}
