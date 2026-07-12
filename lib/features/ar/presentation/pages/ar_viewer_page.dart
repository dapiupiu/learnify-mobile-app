import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ArViewerPage extends StatelessWidget {
  final String modelPath;

  const ArViewerPage({
    super.key,
    required this.modelPath,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Extract a user-friendly name from the file path
    final fileName = modelPath.split('/').last;
    final modelName = fileName.replaceAll('.glb', '').replaceAll('.gltf', '').toUpperCase();

    const Color pastelCream = Color(0xFFFFF9E6); // Soft child-friendly pastel cream

    return Scaffold(
      backgroundColor: pastelCream,
      body: SafeArea(
        child: Stack(
          children: [
            // Fullscreen 3D Viewer
            Center(
              child: ModelViewer(
                src: modelPath,
                alt: 'A 3D $modelName model',
                ar: true,
                autoRotate: true,
                cameraControls: true,
                autoPlay: true,
                backgroundColor: pastelCream,
              ),
            ),

            // Floating Back Button (Contrasty on bright pastel background)
            Positioned(
              top: 16,
              left: 16,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => context.pop(),
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                     width: 48,
                     height: 48,
                     decoration: BoxDecoration(
                       color: Colors.white.withValues(alpha: 0.8),
                       shape: BoxShape.circle,
                       border: Border.all(
                         color: Colors.black.withValues(alpha: 0.05),
                         width: 1.5,
                       ),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.black.withValues(alpha: 0.03),
                           blurRadius: 6,
                           offset: const Offset(0, 2),
                         ),
                       ],
                     ),
                     child: Icon(
                       Icons.arrow_back_ios_new_rounded,
                       size: 18,
                       color: Colors.grey[800],
                     ),
                  ),
                ),
              ),
            ),

            // Immersive Overlay Controls Info at the bottom (Premium Glassmorphic Light Card)
            Positioned(
              bottom: 24,
              left: 24,
              right: 24,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.black.withValues(alpha: 0.05),
                    width: 1.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'AR PREVIEW',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.primary,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.threed_rotation_rounded,
                          size: 16,
                          color: Colors.grey[700],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Objek 3D: $modelName',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Gunakan 1 jari untuk memutar objek, cubit layar untuk memperbesar/memperkecil.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
