import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify/shared/widgets/shared_bottom_nav_bar.dart';
import 'package:learnify/shared/widgets/bouncy_button.dart';
import 'package:learnify/shared/widgets/lego_card.dart';
import 'package:learnify/features/shared/widgets/app_background_stack.dart';

class ArListPage extends StatelessWidget {
  const ArListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arItems = [
      {'title': 'Kerbau (Buffalo)', 'subtitle': 'Mencari Makan Rumput', 'color': const Color(0xFF9E9E9E), 'icon': Icons.pets, 'asset': 'assets/models/cow.glb'}, // Bold Grey
      {'title': 'Ikan (Fish)', 'subtitle': 'Berenang dengan Cepat', 'color': const Color(0xFF00BCD4), 'icon': Icons.water, 'asset': 'assets/models/fish.glb'}, // Bold Cyan
      {'title': 'Laba-laba (Spider)', 'subtitle': 'Merayap Lincah', 'color': const Color(0xFF673AB7), 'icon': Icons.bug_report, 'asset': 'assets/models/spider.glb'}, // Bold Purple
      {'title': 'Serigala (Wolf)', 'subtitle': 'Mengaum di Malam Hari', 'color': const Color(0xFFD32F2F), 'icon': Icons.pets, 'asset': 'assets/models/wolf.glb'}, // Bold Crimson
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: AppBackgroundStack(
        child: Column(
          children: [
            _buildCustomHeader(context, 'Dunia AR 3D'),
            Expanded(
              child: ListView(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 20),
                children: [
                  _buildInteractiveGuideBanner(),
                  const SizedBox(height: 24),
                  ...arItems.map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _buildArCard(context, item),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SharedBottomNavBar(currentIndex: 2),
    );
  }

  Widget _buildInteractiveGuideBanner() {
    return LegoCard(
      bgColor: Colors.white.withValues(alpha: 0.9), // Soft background
      borderColor: const Color(0xFF0C6780),
      borderWidth: 2.0, // Thinner border
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [const Icon(Icons.lightbulb, color: Colors.amber), const SizedBox(width: 8), Text('Panduan Bermain AR', style: GoogleFonts.quicksand(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xFF0C6780)))]),
          const SizedBox(height: 12),
          Text('1. 👆 Putar Hewan\n2. 🔍 Pinch untuk Zoom', style: GoogleFonts.quicksand(fontSize: 14, color: const Color(0xFF7d4200))),
        ],
      ),
    );
  }

  Widget _buildCustomHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 0),
      child: Row(
        children: [
          BouncyButton(
            onTap: () { if (context.canPop()) context.pop(); else context.go('/main-dashboard'); },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 4))]),
              child: const Icon(Icons.arrow_back, color: Color(0xFF0C6780)),
            ),
          ),
          const SizedBox(width: 16),
          Text(title, style: GoogleFonts.quicksand(fontSize: 24, fontWeight: FontWeight.bold, color: const Color(0xFF0C6780))),
        ],
      ),
    );
  }

  Widget _buildArCard(BuildContext context, Map<String, dynamic> item) {
    return BouncyButton(
      onTap: () => context.push('/ar-viewer?model=${item['asset']}'),
      child: LegoCard(
        bgColor: item['color'],
        borderColor: Colors.white.withValues(alpha: 0.5), // Softer border
        borderWidth: 2.0,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        constraints: const BoxConstraints(minHeight: 120),
        child: Row(
          children: [
            Container(width: 64, height: 64, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.5), shape: BoxShape.circle), child: Icon(item['icon'], size: 32, color: Colors.white)), // Softer icon color
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(item['title'], style: GoogleFonts.quicksand(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text(item['subtitle'], style: GoogleFonts.quicksand(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white70)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 24),
          ],
        ),
      ),
    );
  }
}
