import 'package:flutter/material.dart';

/// The screen slides to the left
class LeftSlideTransition extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const LeftSlideTransition({
    super.key,
    required this.animation,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation.drive(
        Tween<Offset>(begin: const Offset(0.5, 0), end: Offset.zero).chain(
          CurveTween(curve: Curves.linear),
        ),
      ),
      child: child,
    );
  }
}
