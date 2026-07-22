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
      {'title': 'Harimau', 'subtitle': 'Berjalan', 'color': const Color(0xFFFFB477), 'icon': Icons.pets},
      {'title': 'Dinosaurus', 'subtitle': 'Mengaum', 'color': const Color(0xFF0C6780), 'icon': Icons.cruelty_free},
      {'title': 'Kupu-kupu', 'subtitle': 'Terbang', 'color': const Color(0xFF4B53BC), 'icon': Icons.flutter_dash},
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
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(24),
                itemCount: arItems.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) => _buildArCard(context, arItems[index]),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SharedBottomNavBar(currentIndex: 2),
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
      onTap: () => context.push('/ar-viewer'),
      child: LegoCard(
        bgColor: item['color'],
        borderColor: Colors.white,
        borderWidth: 2.0,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        constraints: const BoxConstraints(minHeight: 140, maxHeight: 160),
        child: Row(
          children: [
            Container(width: 64, height: 64, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: Icon(item['icon'], size: 32, color: item['color'])),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)), child: Text('3D Hidup ✨', style: GoogleFonts.quicksand(fontSize: 10, fontWeight: FontWeight.bold))),
                  Text(item['title'], style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text(item['subtitle'], style: GoogleFonts.quicksand(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white.withValues(alpha: 0.9))),
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

