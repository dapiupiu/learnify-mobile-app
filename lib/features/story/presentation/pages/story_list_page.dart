import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify/shared/widgets/shared_bottom_nav_bar.dart';
import 'package:learnify/shared/widgets/bouncy_button.dart';
import 'package:learnify/features/shared/widgets/app_background_stack.dart';

class StoryListPage extends StatelessWidget {
  const StoryListPage({super.key});

  static const Color primaryColor = Color(0xFF0c6780);
  static const Color secondaryColor = Color(0xFF4b53bc);
  static const Color tertiaryContainerColor = Color(0xFFffb477);

  @override
  Widget build(BuildContext context) {
    final stories = [
      {'title': 'Si Kancil yang Cerdik', 'color': tertiaryContainerColor, 'icon': Icons.pets},
      {'title': 'Petualangan Awan Kecil', 'color': const Color(0xFF87ceeb), 'icon': Icons.cloud},
      {'title': 'Bintang Pertamaku', 'color': secondaryColor, 'icon': Icons.star, 'textColor': Colors.white},
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: AppBackgroundStack(
        child: Column(
          children: [
            _buildCustomHeader(context, 'Pojok Cerita'),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 110),
                itemCount: stories.length,
                separatorBuilder: (_, __) => const SizedBox(height: 24),
                itemBuilder: (context, index) => _buildStoryCard(context, stories[index]),
              ),
            ),
          ],
        ),
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
              child: const Icon(Icons.arrow_back, color: primaryColor),
            ),
          ),
          const SizedBox(width: 16),
          Text(title, style: GoogleFonts.quicksand(fontSize: 24, fontWeight: FontWeight.bold, color: primaryColor)),
        ],
      ),
    );
  }

  Widget _buildStoryCard(BuildContext context, Map<String, dynamic> item) {
    Color textColor = item['textColor'] ?? Colors.black;
    return BouncyButton(
      onTap: () => context.push('/story-detail', extra: item),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: item['color'], borderRadius: BorderRadius.circular(24), border: Border.all(color: Colors.white, width: 4), boxShadow: [BoxShadow(color: item['color'], offset: const Offset(0, 8))]),
        child: Row(
          children: [
            Container(width: 80, height: 80, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: Icon(item['icon'], size: 48, color: item['color'])),
            const SizedBox(width: 16),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(item['title'], style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.bold, color: textColor)), const SizedBox(height: 4), Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(8)), child: Text('Dongeng', style: GoogleFonts.quicksand(fontSize: 14, fontWeight: FontWeight.bold, color: textColor)))]))
          ],
        ),
      ),
    );
  }
}
