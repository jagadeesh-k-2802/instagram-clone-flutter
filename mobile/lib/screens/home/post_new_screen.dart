import 'package:flutter/material.dart';

class PostNewScreen extends StatefulWidget {
  const PostNewScreen({super.key});

  @override
  State<PostNewScreen> createState() => _PostNewScreenState();
}

class _PostNewScreenState extends State<PostNewScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text('PostNewScreen'),
          )
        ],
      ),
    );
  }
}
