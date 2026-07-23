import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify/features/shared/widgets/app_background_stack.dart';
import 'package:learnify/shared/widgets/bouncy_button.dart';
import 'package:learnify/shared/widgets/shared_bottom_nav_bar.dart';

class LearningHubPage extends StatelessWidget {
  const LearningHubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FA), // Sky Tint
      extendBody: true,
      body: Column(
        children: [
          _buildCustomHeader(context, 'Pusat Belajar'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 110),
              children: [
                _buildJumboCard(
                  context,
                  title: 'Modul Belajar',
                  icon: Icons.book,
                  color: const Color(0xFF028090), // Electric Teal
                  shadowColor: const Color(0xFF005F73),
                  route: '/module-list',
                ),
                const SizedBox(height: 24),
                _buildJumboCard(
                  context,
                  title: 'Pojok Cerita',
                  icon: Icons.auto_stories,
                  color: const Color(0xFFFF8C00), // Vibrant Mandarin
                  shadowColor: const Color(0xFFD96B00),
                  route: '/story-list',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const SharedBottomNavBar(currentIndex: 1),
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

  Widget _buildJumboCard(BuildContext context, {required String title, required IconData icon, required Color color, required Color shadowColor, required String route}) {
    return BouncyButton(
      onTap: () => context.push(route),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24), // 24px rounded
          boxShadow: [BoxShadow(color: shadowColor, offset: const Offset(0, 8))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: Colors.white),
            const SizedBox(width: 24),
            Text(title, style: GoogleFonts.quicksand(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
