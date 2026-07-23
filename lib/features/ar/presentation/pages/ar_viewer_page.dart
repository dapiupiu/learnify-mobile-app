import 'dart:html' as html;
import 'dart:js' as js;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:learnify/shared/widgets/lego_card.dart';
import 'package:learnify/shared/widgets/bouncy_button.dart';
import 'package:learnify/core/services/audio_service.dart';

class ArViewerPage extends StatefulWidget {
  final String modelPath;

  const ArViewerPage({
    super.key,
    required this.modelPath,
  });

  @override
  State<ArViewerPage> createState() => _ArViewerPageState();
}

class _ArViewerPageState extends State<ArViewerPage> {
  late String _selectedAnimation;
  late Map<String, String> _animationMap;
  bool _isViewerActive = true;

  // Helper for bubble effect on tap
  Widget _wrapBubble(Widget child, VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
        AudioService().playClickSfx(); // Audio feedback
        onTap();
      },
      child: AnimatedScale(
        scale: 0.95, // Simple bubble-like scale effect
        duration: const Duration(milliseconds: 100),
        child: child,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final animalName = widget.modelPath.split('/').last.replaceAll('.glb', '').toLowerCase();
    
    if (animalName.contains('fish')) {
      _selectedAnimation = 'Swim';
      _animationMap = {};
    } else if (animalName.contains('cow')) {
      _selectedAnimation = 'Idle';
      _animationMap = {'Jalan': 'Walk', 'Diam': 'Idle'};
    } else if (animalName.contains('spider')) {
      _selectedAnimation = '2'; // Default Diam
      _animationMap = {'Lompat': '3', 'Diam': '2', 'Kejutan': '1'};
    } else { // Wolf
      _selectedAnimation = 'Idle';
      _animationMap = {'Lari': 'Gallop', 'Jalan': 'Walk', 'Diam': 'Idle'};
    }

    if (kIsWeb) {
      Future.delayed(const Duration(seconds: 2), () {
        final mv = html.document.querySelector('model-viewer');
        if (mv != null) {
          final available = mv.getAttribute('available-animations');
          html.window.console.log('--- AR DEBUG: Available animations: $available ---');
        }
      });
    }
  }

  void _updateAnimation(String newAnimation) async {
    setState(() {
      _isViewerActive = false;
    });
    
    await Future.delayed(const Duration(milliseconds: 100));
    
    setState(() {
      _selectedAnimation = newAnimation;
      _isViewerActive = true;
    });

    if (kIsWeb) {
      final mv = html.document.querySelector('model-viewer');
      if (mv != null) {
        mv.setAttribute('animation-name', newAnimation);
        html.window.console.log('Available animations: ${mv.getAttribute('available-animations')}');
        
        js.context.callMethod('eval', ['document.querySelector("model-viewer").play()']);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final animalName = widget.modelPath.split('/').last.replaceAll('.glb', '').toLowerCase();
    final habitat = _getHabitatConfig(animalName);
    final animalType = animalName.contains('cow') ? 'cow' : (animalName.contains('spider') ? 'spider' : (animalName.contains('fish') ? 'fish' : 'wolf'));

    return Scaffold(
      body: Stack(
        children: [
          // Dynamic Habitat Background with Ornaments
          _buildHabitatBackground(habitat, animalName),
          
          if (_isViewerActive)
            ModelViewer(
              key: ValueKey('mv_${animalType}_${_selectedAnimation}_${DateTime.now().millisecondsSinceEpoch}'),
              src: widget.modelPath,
              ar: true,
              autoRotate: true,
              cameraControls: true,
              autoPlay: true,
              animationName: _selectedAnimation,
              backgroundColor: Colors.transparent,
            )
          else
            const Center(child: CircularProgressIndicator()),

          Positioned(
            top: 48,
            left: 16,
            child: _wrapBubble(
              BouncyButton(
                onTap: () => context.pop(),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 4))]),
                  child: const Icon(Icons.arrow_back, color: Color(0xFF0C6780)),
                ),
              ),
              () {},
            ),
          ),
          
          Positioned(
            bottom: 24,
            left: 20,
            right: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_animationMap.isNotEmpty)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _animationMap.entries.map((entry) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: _wrapBubble(
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: _selectedAnimation == entry.value ? habitat.borderColor : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: habitat.borderColor, width: 3),
                              boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 4))],
                            ),
                            child: Text(entry.key, style: GoogleFonts.quicksand(color: _selectedAnimation == entry.value ? Colors.white : habitat.borderColor, fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                          () => _updateAnimation(entry.value),
                        ),
                      )).toList(),
                    ),
                  )
                else
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(color: habitat.borderColor, borderRadius: BorderRadius.circular(20), boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 4))]),
                    child: Text('Sedang Berenang 🐟', style: GoogleFonts.quicksand(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                const SizedBox(height: 16),
                LegoCard(
                  bgColor: Colors.white,
                  borderColor: habitat.borderColor,
                  borderWidth: 4,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(habitat.title, style: GoogleFonts.quicksand(fontSize: 18, fontWeight: FontWeight.bold, color: habitat.borderColor)),
                      Text('💡 Tips: ${habitat.tips}', style: GoogleFonts.quicksand(fontSize: 14, color: Colors.grey[700])),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHabitatBackground(_HabitatConfig habitat, String animalName) {
    // Seamless Cow gradient
    final gradient = animalName.contains('cow') 
      ? const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF4FC3F7), Color(0xFFE0F7FA), Color(0xFFA5D6A7), Color(0xFF4CAF50)],
          stops: [0.0, 0.4, 0.7, 1.0],
        )
      : LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: habitat.gradientColors,
          stops: const [0.0, 0.4, 1.0],
        );

    return Container(
      decoration: BoxDecoration(gradient: gradient),
      child: Stack(
        children: [...habitat.ornaments],
      ),
    );
  }

  _HabitatConfig _getHabitatConfig(String animalName) {
    if (animalName.contains('cow')) {
      return _HabitatConfig(
        gradientColors: [const Color(0xFF3FC5F0), const Color(0xFF80D8FF), const Color(0xFF2E7D32)],
        borderColor: const Color(0xFFFF9E44),
        title: 'Habitat: Peternakan Kerbau 🐃',
        tips: 'Kerbau ingin berjalan-jalan!',
        ornaments: [],
      );
    } else if (animalName.contains('fish')) {
      return _HabitatConfig(
        gradientColors: [const Color(0xFF00E5FF), const Color(0xFF0288D1), const Color(0xFF01579B)],
        borderColor: const Color(0xFF00838F),
        title: 'Habitat: Lautan 🐟',
        tips: 'Lihat ikan berenang dengan anggun.',
        ornaments: [
          Positioned(top: 200, left: 50, child: Icon(Icons.circle, color: Colors.white.withValues(alpha: 0.2), size: 50)),
          Positioned(top: 300, left: 200, child: Icon(Icons.circle, color: Colors.white.withValues(alpha: 0.1), size: 30)),
        ],
      );
    } else if (animalName.contains('spider')) {
      return _HabitatConfig(
        gradientColors: [const Color(0xFF1B5E20), const Color(0xFF4A148C), const Color(0xFF12005E)],
        borderColor: const Color(0xFF5C6BC0),
        title: 'Habitat: Hutan Malam 🕸️',
        tips: 'Hati-hati, laba-laba sedang merayap!',
        ornaments: [
          Positioned(top: 100, right: 20, child: Icon(Icons.hub, color: Colors.white.withValues(alpha: 0.1), size: 200)),
        ],
      );
    } else {
      return _HabitatConfig(
        gradientColors: [const Color(0xFF00897B), const Color(0xFF0D47A1), const Color(0xFF1A237E)],
        borderColor: const Color(0xFFE53935),
        title: 'Habitat: Pegunungan 🐺',
        tips: 'Serigala mengaum di malam hari!',
        ornaments: [
          Positioned(top: 50, right: 50, child: Icon(Icons.nights_stay, color: Colors.yellow.withValues(alpha: 0.2), size: 80)),
        ],
      );
    }
  }
}

class _HabitatConfig {
  final List<Color> gradientColors;
  final Color borderColor;
  final String title;
  final String tips;
  final List<Widget> ornaments;

  _HabitatConfig({required this.gradientColors, required this.borderColor, required this.title, required this.tips, this.ornaments = const []});
}
