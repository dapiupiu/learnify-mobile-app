import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Learnify'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push('/settings'),
            tooltip: 'Pengaturan',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Header with Mascot placeholder
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat Pagi,',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Bu Sinta 👋',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: theme.colorScheme.primary.withValues(alpha: 0.3),
                        width: 2,
                      ),
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
              const SizedBox(height: 12),
              Text(
                'Siap mengajar dengan media interaktif hari ini?',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.black45,
                ),
              ),
              const SizedBox(height: 32),
              
              // Menu Title
              Text(
                'Pilih Media Pembelajaran',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              
              // Menu Cards
              _buildMenuCard(
                context: context,
                title: 'Video Pembelajaran',
                subtitle: 'Tonton materi visual menarik',
                icon: Icons.play_circle_fill_rounded,
                color: theme.colorScheme.primary,
                onTap: () => context.push('/videos'),
              ),
              const SizedBox(height: 16),
              
              _buildMenuCard(
                context: context,
                title: 'Kuis Interaktif',
                subtitle: 'Evaluasi belajar menyenangkan',
                icon: Icons.quiz_rounded,
                color: theme.colorScheme.secondary,
                onTap: () => context.push('/quiz'),
              ),
              const SizedBox(height: 16),
              
              _buildMenuCard(
                context: context,
                title: 'Augmented Reality (AR)',
                subtitle: 'Visualisasi objek 3D interaktif',
                icon: Icons.view_in_ar_rounded,
                color: theme.colorScheme.tertiary,
                onTap: () => context.push('/ar'),
              ),
            ],
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
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Colors.black.withValues(alpha: 0.03),
              width: 1.0,
            ),
          ),
          child: Row(
            children: [
              // Icon Container
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: color.withValues(alpha: 0.9),
                ),
              ),
              const SizedBox(width: 20),
              
              // Text Description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Arrow Indicator
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Colors.black.withValues(alpha: 0.2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
