import 'package:flutter/material.dart';

/// [ProgressButton] wrapped around [ElevatedButton]that displays
/// [CircularProgressIndicator] when [inProgress]
/// else displays [text] takes [onTap] for callback
class ProgressButton extends StatelessWidget {
  final bool inProgress;
  final void Function() onTap;
  final String text;

  const ProgressButton({
    super.key,
    required this.inProgress,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: inProgress ? null : onTap,
      child: inProgress
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          : Text(text),
    );
  }
}
