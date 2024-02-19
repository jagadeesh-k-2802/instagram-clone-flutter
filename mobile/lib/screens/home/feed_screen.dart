import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/logo.svg'),
            InkWell(
              onTap: () => context.pushNamed('message'),
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              child: SvgPicture.asset(
                'assets/icons/message.svg',
                height: 26,
                width: 26,
              ),
            )
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text('FeedScreen'),
          )
        ],
      ),
    );
  }
}
