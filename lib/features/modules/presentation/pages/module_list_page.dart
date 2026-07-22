import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify/shared/widgets/shared_bottom_nav_bar.dart';
import 'package:learnify/shared/widgets/bouncy_button.dart';
import 'package:learnify/shared/widgets/lego_card.dart';
import 'package:learnify/core/services/audio_service.dart';
import 'package:learnify/features/shared/widgets/app_background_stack.dart';

class ModuleListPage extends StatelessWidget {
  const ModuleListPage({super.key});

  static const Color primaryColor = Color(0xFF0c6780);
  static const Color secondaryColor = Color(0xFF4b53bc);
  static const Color tertiaryColor = Color(0xFF904d00);
  static const Color tertiaryContainerColor = Color(0xFFffb477);
  static const Color secondaryContainerColor = Color(0xFF8991fe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: AppBackgroundStack(
        child: Column(
          children: [
            _buildCustomHeader(context, 'Modul Belajar'),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  children: [
                    _buildModuleCard(context, title: 'Belajar Huruf', subtitle: 'Mengenal huruf A-Z', icon: Icons.abc, color: primaryColor, bgColor: Colors.white, textColor: primaryColor, videoId: '1'),
                    const SizedBox(height: 24),
                    _buildModuleCard(context, title: 'Belajar Angka', subtitle: 'Mengenal angka 1-10', icon: Icons.numbers, color: secondaryColor, bgColor: secondaryContainerColor, textColor: Colors.white, videoId: '2'),
                    const SizedBox(height: 24),
                    _buildModuleCard(context, title: 'Dunia Hewan', subtitle: 'Mengenal suara hewan', icon: Icons.pets, color: tertiaryColor, bgColor: tertiaryContainerColor, textColor: tertiaryColor, videoId: '4'),
                  ],
                ),
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
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
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

  void _showModuleDialog(BuildContext context, String title, String videoId) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: LegoCard(
          bgColor: const Color(0xFFE0F2FE),
          borderColor: primaryColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Mulai Belajar!', style: GoogleFonts.quicksand(fontSize: 24, fontWeight: FontWeight.bold, color: primaryColor)),
              const SizedBox(height: 16),
              Text('Apakah kamu siap belajar $title?', style: GoogleFonts.quicksand(fontSize: 18, color: const Color(0xFF7d4200))),
              const SizedBox(height: 24),
              BouncyButton(
                onTap: () {
                  AudioService().playClickSfx();
                  context.pop(); // Close dialog
                  context.push('/videos/$videoId'); // Navigate to video
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFffb477),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFF904d00), width: 4),
                    boxShadow: [const BoxShadow(color: Color(0xFF904d00), offset: Offset(0, 8))],
                  ),
                  child: const Center(child: Text('Mulai!', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF904d00), fontSize: 20))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModuleCard(BuildContext context, {required String title, required String subtitle, required IconData icon, required Color color, required Color bgColor, required Color textColor, required String videoId}) {
    return BouncyButton(
      onTap: () => _showModuleDialog(context, title, videoId),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(24), border: Border.all(color: color, width: 4), boxShadow: [BoxShadow(color: color, offset: const Offset(0, 8))]),
        child: Row(
          children: [
            Container(width: 80, height: 80, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.3), shape: BoxShape.circle), child: Icon(icon, size: 48, color: textColor)),
            const SizedBox(width: 16),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.bold, color: textColor)), Text(subtitle, style: GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.bold, color: textColor.withValues(alpha: 0.9)))]))
          , const Icon(Icons.volume_up, size: 32, color: primaryColor)
          ],
        ),
      ),
    );
  }
}

