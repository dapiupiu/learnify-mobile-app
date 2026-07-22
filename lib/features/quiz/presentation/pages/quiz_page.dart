import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../controllers/quiz_controller.dart';
import 'package:learnify/shared/widgets/bouncy_button.dart';
import 'package:learnify/shared/widgets/lego_card.dart';
import 'package:learnify/shared/widgets/floating_clouds.dart';
import 'package:learnify/core/services/audio_service.dart';

class QuizPage extends ConsumerStatefulWidget {
  final String category;
  final String difficulty;

  const QuizPage({
    super.key,
    required this.category,
    required this.difficulty,
  });

  @override
  ConsumerState<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  String? feedback;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final quizParam = (category: widget.category, difficulty: widget.difficulty);
    final quizState = ref.watch(quizProvider(quizParam));
    
    // Listen for quiz completion to trigger navigation
    ref.listen<QuizState>(quizProvider(quizParam), (previous, next) {
      if (next.isFinished) {
        context.go('/quiz-result?score=${next.finalScore}');
      }
    });

    final Color primaryColor = theme.colorScheme.primary;

    if (quizState.questions.isEmpty) {
      return Scaffold(
        backgroundColor: const Color(0xFFE0F2FE),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final currentQuestion = quizState.questions[quizState.currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFE0F2FE),
      body: Stack(
        children: [
          const FloatingClouds(),
          SafeArea(
            child: Column(
              children: [
                // Custom App Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      BouncyButton(
                        onTap: () {
                          AudioService().playClickSfx();
                          context.pop();
                        },
                        child: const Icon(Icons.arrow_back, color: Color(0xFF0c6780), size: 32),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Kuis ${widget.category}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFF0c6780)),
                      ),
                    ],
                  ),
                ),
                
                // Question Area
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        LegoCard(
                          borderColor: primaryColor,
                          padding: const EdgeInsets.all(24.0),
                          child: Text(
                            currentQuestion.questionText,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0c6780),
                              fontSize: 22,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Feedback Indicator
                        if (feedback != null)
                          Text(
                            feedback!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: feedback == 'Benar! 🎉' ? Colors.green : Colors.red,
                            ),
                          ),
                          
                        const SizedBox(height: 16),
                        
                        // Options List
                        Expanded(
                          child: ListView.separated(
                            itemCount: currentQuestion.options.length,
                            separatorBuilder: (context, index) => const SizedBox(height: 16),
                            itemBuilder: (context, index) {
                              final optionText = currentQuestion.options[index];
                              return _buildOptionButton(index, optionText, quizParam);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionButton(int index, String text, QuizParam quizParam) {
    return BouncyButton(
      onTap: () async {
        AudioService().playClickSfx();
        
        final isCorrect = index == ref.read(quizProvider(quizParam)).questions[ref.read(quizProvider(quizParam)).currentIndex].correctOptionIndex;
        setState(() {
          feedback = isCorrect ? 'Benar! 🎉' : 'Salah! ❌';
        });
        
        await Future.delayed(const Duration(seconds: 1));
        if (mounted) {
          setState(() {
            feedback = null;
          });
          ref.read(quizProvider(quizParam).notifier).answerQuestion(index);
        }
      },
      child: LegoCard(
        borderColor: const Color(0xFF4b53bc),
        bgColor: const Color(0xFF8991fe),
        padding: const EdgeInsets.all(16.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
