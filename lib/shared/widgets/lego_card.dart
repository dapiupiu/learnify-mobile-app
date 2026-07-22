import 'package:flutter/material.dart';

class LegoCard extends StatelessWidget {
  final Widget child;
  final Color bgColor;
  final Color borderColor;
  final double borderWidth;
  final double depth;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final BoxConstraints? constraints;

  const LegoCard({
    super.key,
    required this.child,
    this.bgColor = Colors.white,
    this.borderColor = const Color(0xFF0c6780),
    this.borderWidth = 4.0,
    this.depth = 8.0,
    this.borderRadius = 24.0,
    this.padding,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        final double screenWidth = MediaQuery.of(context).size.width;
        
        // Responsive scaling factor: 1.0 (mobile) -> 1.5 (4K IFP TV)
        final double scaleFactor = screenWidth > 1920
            ? 1.5
            : (screenWidth > 1200
                ? 1.3
                : (screenWidth > 600 ? 1.15 : 1.0));

        final double adjustedBorderWidth = borderWidth * scaleFactor;
        final double adjustedDepth = depth * scaleFactor;
        final double adjustedRadius = borderRadius * scaleFactor;
        
        final EdgeInsetsGeometry adjustedPadding = padding ?? EdgeInsets.symmetric(
          horizontal: 20.0 * scaleFactor,
          vertical: 20.0 * scaleFactor,
        );

        return Container(
          constraints: (constraints ?? const BoxConstraints()).copyWith(
            minWidth: 56.0 * scaleFactor,
            minHeight: 56.0 * scaleFactor,
          ),
          padding: adjustedPadding,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(adjustedRadius),
            border: Border.all(color: borderColor, width: adjustedBorderWidth),
            boxShadow: [
              BoxShadow(
                color: borderColor,
                offset: Offset(0, adjustedDepth),
              ),
            ],
          ),
          child: child,
        );
      },
    );
  }
}
