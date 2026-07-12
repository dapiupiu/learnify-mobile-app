import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../controllers/quiz_controller.dart';

class QuizPage extends ConsumerWidget {
  final String category;
  final String difficulty;

  const QuizPage({
    super.key,
    required this.category,
    required this.difficulty,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final quizParam = (category: category, difficulty: difficulty);
    final quizState = ref.watch(quizProvider(quizParam));
    
    // Listen for quiz completion to trigger navigation
    ref.listen<QuizState>(quizProvider(quizParam), (previous, next) {
      if (next.isFinished) {
        context.go('/quiz-result?score=${next.finalScore}');
      }
    });

    final Color warningColor = theme.colorScheme.tertiary; // Pastel Orange

    if (quizState.questions.isEmpty) {
      return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final currentQuestion = quizState.questions[quizState.currentIndex];
    final progress = (quizState.currentIndex + 1) / quizState.questions.length;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Kuis $category ($difficulty)',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
        actions: [
          // Timer Widget
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            decoration: BoxDecoration(
              color: warningColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: warningColor.withValues(alpha: 0.4),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.alarm_rounded,
                  size: 16,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 4),
                Text(
                  (() {
                    final minutes = quizState.secondsRemaining ~/ 60;
                    final seconds = quizState.secondsRemaining % 60;
                    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
                  })(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress indicator
              Text(
                'Soal ${quizState.currentIndex + 1} dari ${quizState.questions.length}',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              
              // Simple Progress bar
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: theme.colorScheme.surface,
                  valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
                  minHeight: 8.0,
                ),
              ),
              const SizedBox(height: 32),
              
              // Question Area
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Text(
                  currentQuestion.questionText,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              
              // Title for Options
              Text(
                'Pilih Jawaban:',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              
              // Options List
              Expanded(
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: currentQuestion.options.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final optionText = currentQuestion.options[index];
                    final optionLabel = '${String.fromCharCode(65 + index)}. $optionText'; // A, B, C, D
                    return _buildOptionButton(context, ref, index, optionLabel, quizParam);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(BuildContext context, WidgetRef ref, int index, String text, QuizParam quizParam) {
    final theme = Theme.of(context);
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          ref.read(quizProvider(quizParam).notifier).answerQuestion(index);
        },
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: Colors.black.withValues(alpha: 0.03),
              width: 1.0,
            ),
          ),
          child: Row(
            children: [
              // Circle selector mockup
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black.withValues(alpha: 0.15),
                    width: 2,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  text,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
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
