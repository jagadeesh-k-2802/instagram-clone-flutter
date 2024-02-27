import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/state/search/search_users_provider.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class SearchDetailScreen extends ConsumerStatefulWidget {
  const SearchDetailScreen({super.key});

  @override
  ConsumerState<SearchDetailScreen> createState() => _TagPeopleScreenState();
}

class _TagPeopleScreenState extends ConsumerState<SearchDetailScreen> {
  Timer? debounce;

  @override
  void dispose() {
    debounce?.cancel();
    super.dispose();
  }

  Widget buildSearchBar({required void Function(String value) onUpdate}) {
    return SizedBox(
      height: 36,
      child: TextFormField(
        onChanged: (String? value) {
          if (value == null) return;
          if (debounce?.isActive ?? false) debounce?.cancel();

          debounce = Timer(const Duration(milliseconds: 500), () {
            onUpdate(value);
          });
        },
        autofocus: true,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          fillColor: lightGrayColor,
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }

  void openUserProfile(String userId) {
    context.push(Routes.publicProfilePath(userId));
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final searchUsersNotifier = ref.watch(searchUsersProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: buildSearchBar(
          onUpdate: (String value) {
            searchUsersNotifier.updateSearchValue(value);
          },
        ),
      ),
      body: RiverPagedBuilder.autoDispose(
        firstPageKey: 1,
        limit: 20,
        provider: searchUsersProvider,
        itemBuilder: (context, item, index) {
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
        noItemsFoundIndicatorBuilder: (context, controller) => Container(),
        pagedBuilder: (controller, builder) => PagedListView.separated(
          pagingController: controller,
          builderDelegate: builder,
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}
