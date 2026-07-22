import 'package:flutter/material.dart';
import 'package:learnify/core/services/audio_service.dart';

class BouncyButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  const BouncyButton({super.key, required this.child, required this.onTap});
  @override
  State<BouncyButton> createState() => _BouncyButtonState();
}

class _BouncyButtonState extends State<BouncyButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    // Using elasticOut for a more 'poppy' bubble effect
    _controller = AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 200), 
      lowerBound: 0.85, 
      upperBound: 1.0
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = MediaQuery.of(context).size.width;
        final double scaleFactor = screenWidth > 1920
            ? 1.5
            : (screenWidth > 1200
                ? 1.3
                : (screenWidth > 600 ? 1.15 : 1.0));

        return GestureDetector(
          onTapDown: (_) {
            _controller.forward();
            AudioService().playClickSfx();
          },
          onTapUp: (_) {
            _controller.reverse();
            widget.onTap();
          },
          onTapCancel: () => _controller.reverse(),
          child: ScaleTransition(
            scale: CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 56.0 * scaleFactor,
                minHeight: 56.0 * scaleFactor,
              ),
              child: Center(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: widget.child,
              ),
            ),
          ),
        );
      },
    );
  }
}
