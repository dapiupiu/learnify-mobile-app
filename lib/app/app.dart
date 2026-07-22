import 'package:flutter/material.dart';
import '../core/services/audio_service.dart';
import '../core/utils/app_scroll_behavior.dart';
import 'router.dart';
import 'theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        AudioService().handleFirstInteraction();
      },
      child: MaterialApp.router(
        title: 'Learnify',
        theme: AppTheme.lightTheme,
        routerConfig: appRouter,
        scrollBehavior: AppScrollBehavior(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
