import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bouncy_button.dart';

class SharedBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const SharedBottomNavBar({super.key, required this.currentIndex});

  static const Color tertiaryContainerColor = Color(0xFFffb477);
  static const Color onTertiaryContainer = Color(0xFF7d4200);
  static const Color outlineVariant = Color(0xFFbfc8cd);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600), // Limit width on desktop
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50), border: Border.all(color: outlineVariant, width: 2), boxShadow: const [BoxShadow(color: outlineVariant, blurRadius: 10, offset: Offset(0, 4))]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, 0, 'Home', Icons.home, '/main-dashboard'),
          _buildNavItem(context, 1, 'Learn', Icons.school, '/modules'),
          _buildNavItem(context, 2, 'Play', Icons.videogame_asset, '/ar'),
          _buildNavItem(context, 3, 'Settings', Icons.settings, '/settings'),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index, String label, IconData icon, String route) {
    bool selected = currentIndex == index;
    return BouncyButton(
      onTap: () {
        context.go(route);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(color: selected ? tertiaryContainerColor : Colors.transparent, borderRadius: BorderRadius.circular(24)),
        child: Row(children: [Icon(icon, size: 24, color: selected ? onTertiaryContainer : outlineVariant), if (selected) ...[const SizedBox(width: 8), Text(label, style: GoogleFonts.quicksand(fontWeight: FontWeight.bold, color: onTertiaryContainer))]]),
      ),
    );
  }
}
