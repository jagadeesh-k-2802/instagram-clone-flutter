import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/state/post/local_gallery_provider.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class NewStoryScreen extends ConsumerStatefulWidget {
  const NewStoryScreen({super.key});

  @override
  ConsumerState<NewStoryScreen> createState() => _NewStoryScreenState();
}

class _NewStoryScreenState extends ConsumerState<NewStoryScreen> {
  List<AssetEntity> localImages = [];
  AssetEntity? selectedImage;
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

  Future<void> checkPermissions() async {
    await PhotoManager.clearFileCache();
    await PhotoManager.requestPermissionExtend();
  }

  void selectImage(AssetEntity item) {
    context.pushNamed(Routes.storyUpload, extra: item);
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
            onTap: () => ref
                .read(localGalleryProvider.notifier)
                .updateRequestType(RequestType.image),
          ),
        ],
      ),
    );
  }

  Widget buildGalleryItem(AssetEntity item, int index) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: () => selectImage(item),
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
                preferredSize: const Size.fromHeight(135),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: buildTopBarItems(),
                ),
              ),
            )
          ];
        },
        body: MediaQuery.removePadding(
          removeTop: true,
          context: context,
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
