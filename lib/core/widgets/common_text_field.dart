import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:river_pod/core/extensions/build_context_extensions.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.maxLine,
    this.suffixIcon,
    this.readOnly = false,
  });

  final String title;
  final String hintText;
  final TextEditingController? controller;
  final int? maxLine;
  final Widget? suffixIcon;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: context.appTextTheme.titleLarge,
        ),
        10.height,
        TextField(
          readOnly: readOnly,
          controller: controller,
          maxLines: maxLine,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
          onChanged: (value) {},
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        )
      ],
    );
  }
}
