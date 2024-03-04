import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/state/post/local_gallery_provider.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class NewPostScreen extends ConsumerStatefulWidget {
  const NewPostScreen({super.key});

  @override
  ConsumerState<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends ConsumerState<NewPostScreen> {
  AssetEntity? selectedImage;
  List<AssetEntity> selectImages = [];
  PermissionState permissionState = PermissionState.authorized;
  ScrollController outerController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await checkPermissions();
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
                onTap: () => context.pushReplacementNamed(Routes.newStory),
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

  Future<void> checkPermissions() async {
    await PhotoManager.clearFileCache();
    await PhotoManager.requestPermissionExtend();
  }

  void selectImage(AssetEntity item) {
    setState(() => selectedImage = item);

    outerController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  void addToSelectedPhotos(AssetEntity item) {
    setState(() {
      if (selectImages.contains(item)) {
        selectImages.remove(item);
      } else {
        if (selectImages.length >= 5) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Cannot select more than 5 items')),
          );
          return;
        }

        selectImages.add(item);
      }
    });
  }

  Future<void> onPostUpload() async {
    final gallery = ref.read(localGalleryProvider);
    if (gallery.records?.isEmpty == true) return;

    selectedImage ??= gallery.records?[0];
    List<AssetEntity> data = [];

    if (selectImages.isEmpty) {
      data = [selectedImage!];
    } else {
      data = selectImages.toList();
    }

    context.pushNamed(Routes.postUpload, extra: data);
  }

  Widget buildGalleryItem(AssetEntity item, int index) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: () => selectImage(item),
            onLongPress: () => addToSelectedPhotos(item),
            child: AssetEntityImage(
              key: Key(item.id),
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
            onTap: () => addToSelectedPhotos(item),
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
    final gallery = ref.watch(localGalleryProvider);

    if (permissionState == PermissionState.restricted) {
      return const Scaffold(
        body: Center(
          child: Text('Please give permission to access photos and videos'),
        ),
      );
    }

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
                Visibility(
                  visible: gallery.records?.isNotEmpty == true,
                  child: TextButton(
                    onPressed: onPostUpload,
                    child: Text(
                      'Next',
                      style: bodyLargeBold(context)?.copyWith(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(270),
                child: gallery.records?.isNotEmpty == true
                    ? gallery.records != null && gallery.records?.first != null
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                              height: 250,
                              child: AssetEntityImage(
                                selectedImage != null
                                    ? selectedImage!
                                    : gallery.records![0],
                                isOriginal: true,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : const CircularProgressIndicator()
                    : Container(),
              ),
            )
          ];
        },
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: RiverPagedBuilder.autoDispose(
            firstPageKey: 0,
            limit: 50,
            provider: localGalleryProvider,
            pullToRefresh: true,
            newPageProgressIndicatorBuilder: (
              context,
              controller,
            ) {
              return Container();
            },
            itemBuilder: (context, item, index) {
              return buildGalleryItem(item, index);
            },
            noItemsFoundIndicatorBuilder: (context, controller) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 80, horizontal: 32),
                child: Center(
                  child: Text(
                    'No media available on device',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
            pagedBuilder: (controller, builder) => PagedGridView(
              pagingController: controller,
              builderDelegate: builder,
              gridDelegate: photoGridDelegate,
            ),
          ),
        ),
      ),
    );
  }
}
