import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:instagram_clone/widgets/photo_grid.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  void navigateToSearchDetail() {
    context.pushNamed(Routes.searchDetail);
  }

  Widget buildSearchBar() {
    return SizedBox(
      height: 36,
      child: TextFormField(
        readOnly: true,
        onTap: navigateToSearchDetail,
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
    return Scaffold(
      appBar: AppBar(
        title: buildSearchBar(),
        automaticallyImplyLeading: false,
      ),
      body: PhotoGrid(
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.black38,
            child: const Center(child: Text('Child')),
          );
        },
      ),
    );
  }
}
