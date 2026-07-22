import 'package:flutter/material.dart';
import 'package:learnify/shared/widgets/floating_clouds.dart';

class AppBackgroundStack extends StatelessWidget {
  final Widget child;

  const AppBackgroundStack({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE0F2FE),
      child: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned.fill(
            child: FloatingClouds(),
          ),
          SafeArea(
            child: child,
          ),
        ],
      ),
    );
  }
}
