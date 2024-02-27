import 'package:flutter/material.dart';

/// Creates [Row] with optional [prefixIcon], [text] and optional
/// [suffixIcon]. [onTap] is a callback to underlying [InkWell]
class ClickableListItem extends StatelessWidget {
  final String text;
  final Color textColor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final void Function() onTap;

  const ClickableListItem({
    super.key,
    required this.text,
    this.textColor = Colors.black87,
    this.prefixIcon,
    this.suffixIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Visibility(
              visible: prefixIcon != null,
              child: Row(
                children: [
                  Icon(prefixIcon, size: 28, color: textColor),
                  const SizedBox(width: 12.0)
                ],
              ),
            ),
            Text(
              text,
              style: textTheme.bodyLarge?.copyWith(color: textColor),
            ),
            const Spacer(),
            Visibility(
              visible: suffixIcon != null,
              child: Row(
                children: [
                  Icon(suffixIcon, size: 28, color: textColor),
                  const SizedBox(width: 10.0)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
