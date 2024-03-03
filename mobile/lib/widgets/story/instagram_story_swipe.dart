import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

/// Code from https://github.com/GursheeshSingh/social_media_widgets

class InstagramSwipeController {
  PageController pageController;
  InstagramSwipeController({required this.pageController});

  void nextPage({
    duration = const Duration(milliseconds: 500),
    curve = Curves.linear,
  }) {
    pageController.nextPage(duration: duration, curve: curve);
  }

  void previousPage({
    duration = const Duration(milliseconds: 500),
    curve = Curves.linear,
  }) {
    pageController.previousPage(duration: duration, curve: curve);
  }
}

class InstagramStorySwipe extends StatefulWidget {
  final List<Widget> children;
  final int initialPage;
  final InstagramSwipeController instagramSwipeController;
  final void Function(int) onPageChanged;

  InstagramStorySwipe({
    super.key,
    required this.children,
    this.initialPage = 0,
    required this.instagramSwipeController,
    required this.onPageChanged,
  }) {
    assert(children.isNotEmpty);
  }

  @override
  State<InstagramStorySwipe> createState() => _InstagramStorySwipeState();
}

class _InstagramStorySwipeState extends State<InstagramStorySwipe> {
  double currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    widget.instagramSwipeController.pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageController = widget.instagramSwipeController.pageController;

    return PageView.builder(
      controller: widget.instagramSwipeController.pageController,
      itemCount: widget.children.length,
      onPageChanged: widget.onPageChanged,
      itemBuilder: (context, index) {
        double value;

        if (pageController.position.haveDimensions == false) {
          value = index.toDouble();
        } else {
          value = pageController.page ?? 0;
        }

        return _SwipeWidget(
          key: Key(index.toString()),
          index: index,
          pageNotifier: value,
          child: widget.children[index],
        );
      },
    );
  }
}

double degToRad(num deg) => deg * (pi / 180.0);

class _SwipeWidget extends StatelessWidget {
  final int index;
  final double pageNotifier;
  final Widget child;

  const _SwipeWidget({
    required Key key,
    required this.index,
    required this.pageNotifier,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLeaving = (index - pageNotifier) <= 0;
    final t = (index - pageNotifier);
    final rotationY = lerpDouble(0, 90, t);
    final opacity = lerpDouble(0, 1, t.abs())?.clamp(0.0, 1.0);
    final transform = Matrix4.identity();
    transform.setEntry(3, 2, 0.001);
    transform.rotateY(-degToRad(rotationY ?? 0));

    return Transform(
      alignment: isLeaving ? Alignment.centerRight : Alignment.centerLeft,
      transform: transform,
      child: Stack(
        children: [
          child,
          Positioned.fill(
            child: Opacity(
              opacity: opacity ?? 0,
              child: const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
