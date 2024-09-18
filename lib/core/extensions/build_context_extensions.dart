import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get _theme => Theme.of(this);

  TextTheme get appTextTheme => _theme.textTheme;

  ColorScheme get colorScheme => _theme.colorScheme;

  Size get deviceSize => MediaQuery.sizeOf(this);
}
