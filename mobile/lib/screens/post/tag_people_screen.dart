import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/state/search/search_users_provider.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class TagPeopleScreen extends ConsumerStatefulWidget {
  const TagPeopleScreen({super.key});

  @override
  ConsumerState<TagPeopleScreen> createState() => _TagPeopleScreenState();
}

class _TagPeopleScreenState extends ConsumerState<TagPeopleScreen> {
  Timer? debounce;
  List<SearchUsersResponseData> selectedUsers = [];

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
        if (selectedUsers.length >= 5) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Cannot select more than 5 users')),
          );
          return;
        }

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
        automaticallyImplyLeading: false,
        title: buildSearchBar(
          onUpdate: (String value) {
            searchUsersNotifier.updateSearchValue(value);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          onPressed: onDone,
          child: Text('Done (${selectedUsers.length})'),
        ),
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
                  Icon(
                    selectedUsers.contains(item)
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    color: selectedUsers.contains(item)
                        ? primaryColor
                        : Colors.black38,
                    size: 30.0,
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
