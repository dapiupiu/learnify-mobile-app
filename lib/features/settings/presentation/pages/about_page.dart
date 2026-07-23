import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify/features/shared/widgets/app_background_stack.dart';
import 'package:learnify/shared/widgets/bouncy_button.dart';
import 'package:learnify/shared/widgets/shared_bottom_nav_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const primaryTextNavy = Color(0xFF2C3E50);

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: AppBackgroundStack(
        child: Column(
          children: [
            _buildCustomHeader(context, 'Tentang Aplikasi'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 110),
                child: Column(
                  children: [
                    // Circular mascot avatar
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        'assets/images/mascot.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // App Name
                    const Text(
                      'Learnify',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: primaryTextNavy,
                      ),
                    ),
                    const SizedBox(height: 4),
                    
                    // App Version
                    Text(
                      'Versi 1.0.0',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: primaryTextNavy.withValues(alpha: 0.6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Info Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.0),
                        border: Border.all(
                          color: const Color(0xFFEBF5FF),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Learnify adalah platform pembelajaran interaktif berbasis teknologi Augmented Reality (AR) yang dirancang untuk mendukung stimulasi kognitif, motorik, dan kreativitas anak usia dini (PAUD/TK).\n\nDeskripsi: Menggabungkan elemen visual 3D, konten audio-visual edukatif, dan kuis interaktif untuk menciptakan pengalaman belajar yang menyenangkan.\n\nTarget User: Anak usia dini (PAUD/TK) dan tenaga pendidik.\n\nKelebihan: Pengalaman belajar imersif yang membantu meningkatkan retensi informasi melalui interaksi visual dan kinetik.\n\nSaran Pengembangan: Penambahan modul bahasa asing, integrasi pelaporan perkembangan belajar anak, dan perluasan pustaka konten AR.',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: primaryTextNavy,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Divider(color: Color(0xFFEBF5FF), thickness: 1.5),
                          const SizedBox(height: 16),
                          
                          // Clean developer credit
                          Text(
                            '© 2026 Learnify',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: primaryTextNavy,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SharedBottomNavBar(currentIndex: 3),
    );
  }

  Widget _buildCustomHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 0),
      child: Row(
        children: [
          BouncyButton(
            onTap: () => context.pop(),
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
}
