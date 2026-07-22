import 'package:flutter/material.dart';
import '../../core/services/audio_service.dart';

class PlayfulButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final List<Color>? gradientColors;
  final Color? shadowColor;
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const PlayfulButton({
    super.key,
    required this.child,
    this.onTap,
    this.gradientColors,
    this.shadowColor,
    this.width = double.infinity,
    this.height = 56.0,
    this.borderRadius,
  });

  @override
  State<PlayfulButton> createState() => _PlayfulButtonState();
}

class _PlayfulButtonState extends State<PlayfulButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Child-friendly gradient default
    final defaultGradient = widget.gradientColors ?? [
      theme.colorScheme.primary,
      theme.colorScheme.primary.withValues(alpha: 0.8),
    ];
    
    // Thicker 3D solid shadow base color
    final Color solidShadowColor = widget.shadowColor ?? 
        (widget.gradientColors?.first ?? theme.colorScheme.primary).withValues(alpha: 0.5);
    
    const double shadowHeight = 6.0;
    final double topOffset = _isPressed ? shadowHeight - 2.0 : 0.0;
    final double bottomOffset = _isPressed ? 2.0 : shadowHeight;

    final radius = widget.borderRadius ?? BorderRadius.circular(24.0);

    return GestureDetector(
      onTapDown: (_) {
        if (widget.onTap != null) {
          AudioService().playClickSfx();
          setState(() {
            _isPressed = true;
          });
        }
      },
      onTapUp: (_) {
        if (widget.onTap != null) {
          setState(() {
            _isPressed = false;
          });
          widget.onTap!();
        }
      },
      onTapCancel: () {
        if (widget.onTap != null) {
          setState(() {
            _isPressed = false;
          });
        }
      },
      child: SizedBox(
        width: widget.width,
        height: widget.height + shadowHeight,
        child: Stack(
          children: [
            // Solid Bottom Shadow Layer
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: widget.height,
              child: Container(
                decoration: BoxDecoration(
                  color: solidShadowColor,
                  borderRadius: radius,
                ),
              ),
            ),
            // Floating 3D Button Face Layer
            AnimatedPositioned(
              duration: const Duration(milliseconds: 50),
              left: 0,
              right: 0,
              top: topOffset,
              bottom: bottomOffset,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: defaultGradient,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: radius,
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.2),
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: widget.child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
