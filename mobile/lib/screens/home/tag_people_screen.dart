import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
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
  Timer? debounce;
  List<String> taggedUsers = [];
  List<SearchUsersResponseData> selectedUsers = [];

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

  void onDone() {
    context.pop(selectedUsers);
  }

  void onUserSelect(SearchUsersResponseData user) {
    setState(() {
      if (selectedUsers.contains(user)) {
        selectedUsers.remove(user);
      } else {
        selectedUsers.add(user);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final searchUsersNotifier = ref.watch(searchUsersProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: buildSearchBar(searchUsersNotifier),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: onDone,
            child: Text(
              'Done',
              style: bodyLargeBold(context)?.copyWith(
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: RiverPagedBuilder.autoDispose(
        firstPageKey: 1,
        limit: 20,
        provider: searchUsersProvider,
        pullToRefresh: true,
        itemBuilder: (context, item, index) {
          return InkWell(
            onTap: () => onUserSelect(item),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPagePadding,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ),
                  const Spacer(),
                  Visibility(
                    visible: selectedUsers.contains(item),
                    child: const Icon(
                      Icons.check_circle,
                      color: primaryColor,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        noItemsFoundIndicatorBuilder: (context, controller) {
          return Container();
        },
        pagedBuilder: (controller, builder) => PagedListView.separated(
          pagingController: controller,
          builderDelegate: builder,
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}
