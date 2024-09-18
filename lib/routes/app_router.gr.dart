// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:river_pod/features/create_task/views/create_task_screen.dart'
    as _i1;
import 'package:river_pod/features/home/views/home_screen.dart' as _i2;
import 'package:river_pod/features/splash/splash_screen.dart' as _i3;

/// generated route for
/// [_i1.CreateTaskScreen]
class CreateTaskRoute extends _i4.PageRouteInfo<CreateTaskRouteArgs> {
  CreateTaskRoute({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          CreateTaskRoute.name,
          args: CreateTaskRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CreateTaskRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateTaskRouteArgs>(
          orElse: () => const CreateTaskRouteArgs());
      return _i1.CreateTaskScreen(key: args.key);
    },
  );
}

class CreateTaskRouteArgs {
  const CreateTaskRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'CreateTaskRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.SplashScreen]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SplashScreen();
    },
  );
}
