import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:river_pod/core/extensions/build_context_extensions.dart';
import 'package:river_pod/resource/constant.dart';
import 'package:river_pod/routes/app_router.gr.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    await onNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAnimatedLoading(),
            25.height,
            Text(
              loadingKey,
              style: boldTextStyle(size: 22),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedLoading() {
    return Center(
      child: LoadingAnimationWidget.dotsTriangle(
        size: 100,
        color: context.colorScheme.primary,
      ),
    );
  }

  Future<void> onNavigation() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          context.router.replace(const HomeRoute());
        }
      },
    );
  }
}
