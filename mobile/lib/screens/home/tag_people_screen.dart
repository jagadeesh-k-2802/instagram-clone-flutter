import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/state/search_users.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class TagPeopleScreen extends ConsumerStatefulWidget {
  const TagPeopleScreen({super.key});

  @override
  ConsumerState<TagPeopleScreen> createState() => _TagPeopleScreenState();
}

class _TagPeopleScreenState extends ConsumerState<TagPeopleScreen> {
  List<String> taggedUsers = [];
  Timer? debounce;

  @override
  void dispose() {
    debounce?.cancel();
    super.dispose();
  }

  Widget buildSearchBar(
    SearchUsersNotifier searchUsersNotifier,
  ) {
    return SizedBox(
      height: 36,
      child: TextFormField(
        onChanged: (String? value) {
          if (value == null) return;
          if (debounce?.isActive ?? false) debounce?.cancel();

          debounce = Timer(const Duration(milliseconds: 500), () {
            searchUsersNotifier.updateSearchValue(value);
          });
        },
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

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final searchUsersNotifier = ref.watch(searchUsersProvider.notifier);
    // TODO: Clear provider after exiting this screen
    // TODO: return back selected users to previous screen

    return Scaffold(
      appBar: AppBar(title: buildSearchBar(searchUsersNotifier)),
      body: RiverPagedBuilder<int, SearchUsersResponseData>(
        firstPageKey: 1,
        limit: 20,
        provider: searchUsersProvider,
        pullToRefresh: true,
        itemBuilder: (context, item, index) {
          return InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPagePadding,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32.0,
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
                  )
                ],
              ),
            ),
          );
        },
        noItemsFoundIndicatorBuilder: (context, controller) {
          return Container();
        },
        pagedBuilder: (controller, builder) => PagedListView(
          pagingController: controller,
          builderDelegate: builder,
        ),
      ),
    );
  }
}
