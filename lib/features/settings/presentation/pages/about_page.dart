import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/app_background.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const primaryTextNavy = Color(0xFF2C3E50);

    return Scaffold(
      backgroundColor: Colors.transparent, // transparent so AppBackground shows
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
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
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.face_rounded,
                          size: 60,
                          color: primaryTextNavy,
                        );
                      },
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
                          'Learnify adalah media pembelajaran interaktif inovatif yang dirancang khusus untuk anak-anak usia dini (PAUD/TK). Aplikasi ini menghadirkan video edukatif, kuis interaktif ceria, dan teknologi Augmented Reality (AR) 3D untuk meningkatkan kreativitas dan antusiasme belajar anak.',
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
                          'Oleh Developer',
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
        ),
      ),
    );
  }
}
