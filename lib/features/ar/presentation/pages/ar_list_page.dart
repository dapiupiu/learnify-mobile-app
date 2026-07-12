import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../shared/widgets/app_background.dart';

class ArListPage extends StatelessWidget {
  const ArListPage({super.key});

  final List<Map<String, dynamic>> _arItems = const [
    {
      'title': 'Dunia Huruf',
      'category': 'Bahasa',
      'model': 'assets/models/alphabet.glb',
      'icon': Icons.abc_rounded,
      'color': Color(0xFF6C93CD),
      'description': 'Lihat blok huruf secara nyata.',
    },
    {
      'title': 'Dunia Angka',
      'category': 'Matematika',
      'model': 'assets/models/numbers.glb',
      'icon': Icons.pin_rounded,
      'color': Color(0xFFB0D9B1),
      'description': 'Amati bentuk ruang dan balok.',
    },
    {
      'title': 'Dunia Tumbuhan',
      'category': 'Sains',
      'model': 'assets/models/plant.glb',
      'icon': Icons.local_florist_rounded,
      'color': Color(0xFFF9D9C3),
      'description': 'Melihat indahnya bunga 3D.',
    },
    {
      'title': 'Dunia Hewan',
      'category': 'Fauna',
      'model': 'assets/models/animal.glb',
      'icon': Icons.pets_rounded,
      'color': Color(0xFFE5B8F4),
      'description': 'Bermain bersama hewan peliharaan.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const primaryTextNavy = Color(0xFF2C3E50); // Primary Text Color

    return Scaffold(
      backgroundColor: Colors.transparent, // transparent so AppBackground shows
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Eksplorasi 3D & AR'),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dunia Belajar 3D ✨',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: primaryTextNavy,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Pilih kategori objek 3D untuk diputar, diperbesar, atau diproyeksikan ke dunia nyata dengan AR.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: primaryTextNavy.withValues(alpha: 0.8),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(24.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: _arItems.length,
                  itemBuilder: (context, index) {
                    final item = _arItems[index];
                    final Color itemColor = item['color'] as Color;

                    return GestureDetector(
                      onTap: () {
                        context.push('/ar-viewer?model=${Uri.encodeComponent(item['model'] as String)}');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Solid White Card
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: const Color(0xFFEBF5FF), // Subtle border
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06), // Soft but firm shadow
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: itemColor.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Icon(
                                  item['icon'] as IconData,
                                  color: itemColor,
                                  size: 24,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                item['category'] as String,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: itemColor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['title'] as String,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: primaryTextNavy,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                item['description'] as String,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: primaryTextNavy.withValues(alpha: 0.7),
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ).animate().scale(delay: (index * 100).ms, curve: Curves.easeOutBack);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
