import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learnify/shared/widgets/bouncy_button.dart';
import 'package:learnify/shared/widgets/lego_card.dart';
import 'package:learnify/core/services/audio_service.dart';

class QuizResultPage extends StatelessWidget {
  final int score;

  const QuizResultPage({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    // Assuming 5 questions, max score 100 (20 pts per question)
    
    // Conditional feedback
    String title;
    String message;
    if (score == 100) {
      title = 'Luar Biasa, Hebat!';
      message = 'Kamu benar semua! Pertahankan semangat belajarmu ya!';
    } else if (score >= 60) {
      title = 'Bagus sekali!';
      message = 'Sedikit lagi sempurna, ayo coba sekali lagi!';
    } else {
      title = 'Ayo Semangat!';
      message = 'Jangan menyerah, ayo belajar lagi agar makin pintar!';
    }

    return Scaffold(
      backgroundColor: const Color(0xFFE0F2FE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 48),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0c6780),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                message,
                style: const TextStyle(fontSize: 18, color: Color(0xFF7d4200)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              
              // Score Circle as LegoCard
              LegoCard(
                borderColor: const Color(0xFF904d00),
                bgColor: const Color(0xFFffb477),
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    Text(
                      '$score',
                      style: const TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Skor Akhir',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              
              // Action Buttons
              BouncyButton(
                onTap: () {
                  AudioService().playClickSfx();
                  context.pop();
                },
                child: LegoCard(
                  borderColor: const Color(0xFF0c6780),
                  bgColor: const Color(0xFFE0F2FE),
                  child: const Center(child: Text('Ulangi Kuis', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0c6780), fontSize: 18))),
                ),
              ),
              const SizedBox(height: 16),
              
              BouncyButton(
                onTap: () {
                  AudioService().playClickSfx();
                  context.go('/main-dashboard');
                },
                child: LegoCard(
                  borderColor: const Color(0xFF4b53bc),
                  bgColor: const Color(0xFF8991fe),
                  child: const Center(child: Text('Kembali ke Beranda', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18))),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
