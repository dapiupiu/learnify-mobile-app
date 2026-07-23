import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../controllers/quiz_controller.dart';
import 'package:learnify/shared/widgets/bouncy_button.dart';
import 'package:learnify/shared/widgets/lego_card.dart';
import 'package:learnify/shared/widgets/floating_clouds.dart';
import 'package:learnify/core/services/audio_service.dart';
import 'package:learnify/features/shared/widgets/app_background_stack.dart';
import 'package:learnify/shared/widgets/shared_bottom_nav_bar.dart';

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
        context.go('/quiz-result?score=${next.finalScore}&category=${widget.category}&difficulty=${widget.difficulty}');
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
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: AppBackgroundStack(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
                // Custom App Bar
                _buildCustomHeader(context, 'Kuis ${widget.category}'),
                
                // Question Area
                Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.all(20),
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
                        
                        // Options Grid
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 2.8,
                          children: List.generate(currentQuestion.options.length, (index) {
                            return _buildOptionButton(index, currentQuestion.options[index], quizParam);
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SharedBottomNavBar(currentIndex: 1),
    );
  }

  Widget _buildCustomHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 0),
      child: Row(
        children: [
          BouncyButton(
            onTap: () {
              AudioService().playClickSfx();
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/main-dashboard');
              }
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 4))]),
              child: const Icon(Icons.arrow_back, color: Color(0xFF0c6780)),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFF0c6780)),
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
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
