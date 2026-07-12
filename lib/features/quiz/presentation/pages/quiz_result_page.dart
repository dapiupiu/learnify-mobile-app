import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuizResultPage extends StatelessWidget {
  final int score;

  const QuizResultPage({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final correctAnswers = (score / 20).round();
    final incorrectAnswers = 5 - correctAnswers;
    
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              
              // Celebration Icon/Mascot placeholder
              Icon(
                Icons.emoji_events_rounded,
                size: 90,
                color: theme.colorScheme.tertiary, // Pastel Orange
              ),
              const SizedBox(height: 24),
              
              // Congrats Text
              Text(
                'Luar Biasa, Hebat!',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Anda telah menyelesaikan kuis dengan sangat baik.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              
              // Score Circle
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme.colorScheme.primary.withValues(alpha: 0.3),
                    width: 6,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$score',
                        style: theme.textTheme.displayLarge?.copyWith(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      Text(
                        'Skor Akhir',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              
              // Answer details card
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.black.withValues(alpha: 0.03),
                    width: 1.0,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Correct Answers
                    Row(
                      children: [
                        const Icon(
                          Icons.check_circle_rounded,
                          color: Color(0xFF81C784), // Soft Green
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Benar',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.black45,
                              ),
                            ),
                            Text(
                              '$correctAnswers Soal',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    
                    // Vertical divider
                    Container(
                      height: 30,
                      width: 1,
                      color: Colors.black.withValues(alpha: 0.1),
                    ),
                    
                    // Incorrect Answers
                    Row(
                      children: [
                        const Icon(
                          Icons.cancel_rounded,
                          color: Color(0xFFE57373), // Soft Red
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Salah',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.black45,
                              ),
                            ),
                            Text(
                              '$incorrectAnswers Soal',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const Spacer(),
              
              // Action Buttons
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate back to the quiz start
                    context.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Ulangi Kuis',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              
              SizedBox(
                width: double.infinity,
                height: 54,
                child: OutlinedButton(
                  onPressed: () => context.go('/home'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: theme.colorScheme.primary,
                    side: BorderSide(
                      color: theme.colorScheme.primary.withValues(alpha: 0.5),
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  child: Text(
                    'Kembali ke Beranda',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
