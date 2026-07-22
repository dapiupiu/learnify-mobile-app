import 'package:flutter/material.dart';

class FloatingClouds extends StatefulWidget {
  const FloatingClouds({super.key});

  @override
  State<FloatingClouds> createState() => _FloatingCloudsState();
}

class _FloatingCloudsState extends State<FloatingClouds> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 20))..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          children: [
            Positioned(
              top: 50,
              left: _controller.value * MediaQuery.of(context).size.width - 100,
              child: Icon(Icons.cloud, size: 80, color: Colors.white.withValues(alpha: 0.6)),
            ),
            Positioned(
              top: 200,
              left: (_controller.value * MediaQuery.of(context).size.width * 0.5) - 50,
              child: Icon(Icons.cloud, size: 100, color: Colors.white.withValues(alpha: 0.4)),
            ),
          ],
        );
      },
    );
  }
}
