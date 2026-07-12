import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/playful_button.dart';
import '../../../../shared/widgets/app_background.dart';

class QuizSetupPage extends StatefulWidget {
  const QuizSetupPage({super.key});

  @override
  State<QuizSetupPage> createState() => _QuizSetupPageState();
}

class _QuizSetupPageState extends State<QuizSetupPage> {
  String _selectedCategory = 'Bahasa';
  String _selectedDifficulty = 'Sedang';

  final List<Map<String, dynamic>> _categories = [
    {'name': 'Bahasa', 'icon': Icons.abc_rounded, 'color': const Color(0xFF6C93CD)},
    {'name': 'Matematika', 'icon': Icons.pin_rounded, 'color': const Color(0xFFB0D9B1)},
    {'name': 'Sains', 'icon': Icons.science_rounded, 'color': const Color(0xFFF9D9C3)},
    {'name': 'Fauna', 'icon': Icons.pets_rounded, 'color': const Color(0xFFE5B8F4)},
  ];

  final List<String> _difficulties = ['Mudah', 'Sedang', 'Sulit'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const primaryTextNavy = Color(0xFF2C3E50); // Primary Text Color

    return Scaffold(
      backgroundColor: Colors.transparent, // transparent so AppBackground shows
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Setup Kuis Pintar'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: AppBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome header
                Text(
                  'Ayo Mulai Belajar! 🚀',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: primaryTextNavy,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Pilih kategori kuis dan tingkat kesulitan yang kamu inginkan.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: primaryTextNavy.withValues(alpha: 0.8),
                  ),
                ),
                const SizedBox(height: 32),

                // Category Label
                Text(
                  'Pilih Kategori:',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: primaryTextNavy,
                  ),
                ),
                const SizedBox(height: 12),

                // Categories list of chips (Glassmorphic)
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: _categories.map((cat) {
                    final isSelected = _selectedCategory == cat['name'];
                    final Color catColor = cat['color'] as Color;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategory = cat['name'];
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? catColor : Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: isSelected ? catColor : const Color(0xFFEBF5FF),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: isSelected
                                  ? catColor.withValues(alpha: 0.3)
                                  : Colors.black.withValues(alpha: 0.04),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              cat['icon'] as IconData,
                              color: isSelected ? Colors.white : catColor,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              cat['name'] as String,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : primaryTextNavy,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 32),

                // Difficulty Label
                Text(
                  'Pilih Tingkat Kesulitan:',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: primaryTextNavy,
                  ),
                ),
                const SizedBox(height: 12),

                // Difficulty choices (Glassmorphic)
                Row(
                  children: _difficulties.map((diff) {
                    final isSelected = _selectedDifficulty == diff;
                    Color diffColor = theme.colorScheme.primary;
                    if (diff == 'Sedang') diffColor = theme.colorScheme.secondary;
                    if (diff == 'Sulit') diffColor = theme.colorScheme.tertiary;

                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedDifficulty = diff;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: isSelected ? diffColor : Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: isSelected ? diffColor : const Color(0xFFEBF5FF),
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: isSelected
                                      ? diffColor.withValues(alpha: 0.3)
                                      : Colors.black.withValues(alpha: 0.04),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                diff,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: isSelected ? Colors.white : primaryTextNavy,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const Spacer(),

                // Start Playful 3D Button
                PlayfulButton(
                  onTap: () {
                    context.push('/quiz/$_selectedCategory/$_selectedDifficulty');
                  },
                  gradientColors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.primary.withValues(alpha: 0.8),
                  ],
                  child: Text(
                    'Mulai Kuis 🎯',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
