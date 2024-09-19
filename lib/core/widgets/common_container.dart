import 'package:flutter/material.dart';
import 'package:river_pod/core/extensions/build_context_extensions.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({
    super.key,
    this.child,
    this.height,
  });

  final Widget? child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.deviceSize.width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.colorScheme.primaryContainer,
      ),
      child: child,
    );
  }
}
