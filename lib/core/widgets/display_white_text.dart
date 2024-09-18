import 'package:flutter/material.dart';
import 'package:river_pod/core/extensions/build_context_extensions.dart';

class DisplayWhiteText extends StatelessWidget {
  const DisplayWhiteText({
    super.key,
    required this.text,
    this.textSize,
    this.fontWeight,
  });

  final String text;
  final double? textSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.appTextTheme.headlineSmall?.copyWith(
        color: context.colorScheme.surface,
        fontWeight: fontWeight,
        fontSize: textSize,
      ),
    );
  }
}
