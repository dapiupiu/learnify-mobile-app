import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../shared/widgets/app_background.dart';
import '../controllers/home_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final highScore = ref.watch(highScoreProvider);
    const primaryTextNavy = Color(0xFF2C3E50); // Primary Text/Icons Color
    
    return Scaffold(
      backgroundColor: Colors.transparent, // transparent so AppBackground shows
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push('/settings'),
            tooltip: 'Pengaturan',
          ),
        ],
      ),
      body: AppBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0), // Padding global 20.0
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Left aligned
              children: [
                // Row 1: Logo Learnify + App Name
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(
                            'assets/images/mascot.png',
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.face_rounded,
                                size: 20,
                                color: primaryTextNavy,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Learnify',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: primaryTextNavy,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                
                // Row 2: Sub-caption (Slogan)
                Text(
                  'Media Pembelajaran Interaktif PAUD/TK 🌟',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: primaryTextNavy.withValues(alpha: 0.6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                
                // Row 3: Greeting Section (Greeting on left, Mascot on right)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selamat Pagi,',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: primaryTextNavy.withValues(alpha: 0.8),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Bu Sinta 👋',
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: primaryTextNavy,
                            ),
                          ),
                          const SizedBox(height: 12),
                          // High score badge
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.emoji_events_rounded,
                                  size: 14,
                                  color: theme.colorScheme.primary,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Skor Tertinggi: $highScore',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Mascot circular on the right
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: theme.colorScheme.primary.withValues(alpha: 0.3),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/mascot.png',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.face,
                              size: 40,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Siap mengajar dengan media interaktif hari ini?',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: primaryTextNavy.withValues(alpha: 0.7),
                  ),
                ),
                
                // Breathable spacing before the menu cards
                const SizedBox(height: 36),
                
                // Menu Title
                Text(
                  'Pilih Media Pembelajaran',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: primaryTextNavy,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Animated Menu Cards with bounce effects
                _buildMenuCard(
                  context: context,
                  title: 'Video Pembelajaran',
                  subtitle: 'Tonton materi visual menarik',
                  icon: Icons.play_circle_fill_rounded,
                  color: theme.colorScheme.primary,
                  onTap: () => context.push('/videos'),
                ).animate().scale(delay: 100.ms, curve: Curves.easeOutBack),
                const SizedBox(height: 16),
                
                _buildMenuCard(
                  context: context,
                  title: 'Kuis Interaktif',
                  subtitle: 'Evaluasi belajar menyenangkan',
                  icon: Icons.quiz_rounded,
                  color: theme.colorScheme.secondary,
                  onTap: () => context.push('/quiz-setup'),
                ).animate().scale(delay: 200.ms, curve: Curves.easeOutBack),
                const SizedBox(height: 16),
                
                _buildMenuCard(
                  context: context,
                  title: 'Augmented Reality (AR)',
                  subtitle: 'Visualisasi objek 3D interaktif',
                  icon: Icons.view_in_ar_rounded,
                  color: theme.colorScheme.tertiary,
                  onTap: () => context.push('/ar-list'),
                ).animate().scale(delay: 300.ms, curve: Curves.easeOutBack),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    const primaryTextNavy = Color(0xFF2C3E50); // Primary Text Color
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white, // Solid White Card
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.5), // Softer white border for elegance
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04), // Softer, more elegant floating shadow
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: primaryTextNavy,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: primaryTextNavy.withValues(alpha: 0.6),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black26,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
