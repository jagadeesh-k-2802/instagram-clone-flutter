import 'package:flutter/material.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:instagram_clone/redux/global_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    UserResponseData? user = store.state.user;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(user?.name ?? ''),
          ),
        ],
      ),
    );
  }
}
