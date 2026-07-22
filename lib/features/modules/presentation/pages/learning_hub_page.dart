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
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: AppBackgroundStack(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 64, 24, 24),
              child: Text('Pusat Belajar', style: GoogleFonts.quicksand(fontSize: 32, fontWeight: FontWeight.bold, color: const Color(0xFF0C6780))),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  _buildJumboCard(
                    context,
                    title: 'Modul Belajar',
                    icon: Icons.book,
                    color: const Color(0xFF0C6780),
                    route: '/module-list',
                  ),
                  const SizedBox(height: 24),
                  _buildJumboCard(
                    context,
                    title: 'Pojok Cerita',
                    icon: Icons.auto_stories,
                    color: const Color(0xFFFFB477),
                    route: '/story-list',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SharedBottomNavBar(currentIndex: 1),
    );
  }

  Widget _buildJumboCard(BuildContext context, {required String title, required IconData icon, required Color color, required String route}) {
    return BouncyButton(
      onTap: () => context.push(route),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Colors.white, width: 8),
          boxShadow: [BoxShadow(color: color.withValues(alpha: 0.5), offset: const Offset(0, 16))],
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
