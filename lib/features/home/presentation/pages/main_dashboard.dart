import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify/shared/widgets/shared_bottom_nav_bar.dart';
import 'package:learnify/shared/widgets/floating_clouds.dart';
import 'package:learnify/shared/widgets/bouncy_button.dart';
import 'package:learnify/shared/widgets/lego_card.dart';
import 'package:learnify/core/app_state.dart';
import 'package:learnify/core/services/audio_service.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  final _appState = AppState();

  @override
  void initState() {
    super.initState();
    _appState.addListener(_updateUI);
  }

  @override
  void dispose() {
    _appState.removeListener(_updateUI);
    super.dispose();
  }

  void _updateUI() => setState(() {});

  static const Color primaryColor = Color(0xFF0c6780);
  static const Color tertiaryColor = Color(0xFF904d00);
  static const Color tertiaryContainerColor = Color(0xFFffb477);
  static const Color skyBlueBg = Color(0xFFE0F2FE);
  static const Color outlineVariant = Color(0xFFbfc8cd);
  static const Color onTertiaryContainer = Color(0xFF7d4200);

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (_) {
        AudioService().playClickSfx();
        AudioService().handleFirstInteraction();
      },
      child: Scaffold(
        backgroundColor: skyBlueBg,
        body: Stack(
          children: [
            const FloatingClouds(),
            SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTopAppBar(),
                    const SizedBox(height: 48),
                    _buildWelcomeBadge(),
                    const SizedBox(height: 48),
                    _buildMainCards(),
                    const SizedBox(height: 32),
                    _buildFooter(),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const SharedBottomNavBar(currentIndex: 0),
      ),
    );
  }

  Widget _buildTopAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              child: Image.asset('assets/images/mascot.png', width: 50, height: 50),
            ),
            const SizedBox(width: 12),
            Text('Learnify', style: GoogleFonts.quicksand(fontSize: 32, fontWeight: FontWeight.bold, color: primaryColor)),
          ],
        ),
        IconButton(icon: const Icon(Icons.settings, color: primaryColor, size: 32), onPressed: () => context.push('/settings')),
      ],
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Selamat Pagi';
    } else if (hour < 15) {
      return 'Selamat Siang';
    } else if (hour < 19) {
      return 'Selamat Sore';
    } else {
      return 'Selamat Malam';
    }
  }

  Widget _buildWelcomeBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(color: tertiaryContainerColor, borderRadius: BorderRadius.circular(50), boxShadow: const [BoxShadow(color: onTertiaryContainer, offset: Offset(0, 4))]),
      child: Text('${_getGreeting()}, ${_appState.childName}! 👋', style: GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.bold, color: onTertiaryContainer)),
    );
  }

  Widget _buildMainCards() {
    return Column(
      children: [
        _buildLegoFeatureCard(title: 'Modul Belajar', subtitle: 'Huruf, Angka, Hewan, Warna!', icon: Icons.school, color: primaryColor, onTap: () => context.push('/module-list')),
        const SizedBox(height: 24),
        _buildLegoFeatureCard(title: 'Dunia AR 3D', subtitle: 'Lihat hewan jadi nyata!', icon: Icons.view_in_ar, color: const Color(0xFF6C93CD), onTap: () => context.push('/ar-list')),
        const SizedBox(height: 24),
        _buildLegoFeatureCard(title: 'Pojok Cerita', subtitle: 'Dongeng ajaib!', icon: Icons.menu_book, color: tertiaryColor, onTap: () => context.push('/story-list')),
      ],
    );
  }

  Widget _buildLegoFeatureCard({required String title, required String subtitle, required IconData icon, required Color color, required VoidCallback onTap}) {
    return BouncyButton(
      onTap: onTap,
      child: LegoCard(
        bgColor: Colors.white,
        borderColor: color,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(width: 70, height: 70, decoration: BoxDecoration(color: color.withValues(alpha: 0.2), shape: BoxShape.circle), child: Icon(icon, size: 40, color: color)),
            const SizedBox(width: 16),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor)), Text(subtitle, style: GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor.withValues(alpha: 0.7)))]))
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Column(children: [Text('© 2024 Learnify', style: GoogleFonts.quicksand(fontWeight: FontWeight.bold, color: outlineVariant)), const SizedBox(height: 8), Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Privacy', style: GoogleFonts.quicksand(color: outlineVariant)), const SizedBox(width: 16), Text('Help', style: GoogleFonts.quicksand(color: outlineVariant))])]);
  }
}
