import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/quiz_model.dart';

class QuizState {
  final List<QuizModel> questions;
  final int currentIndex;
  final int correctAnswersCount;
  final int secondsRemaining;
  final bool isFinished;
  final int finalScore;

  const QuizState({
    required this.questions,
    this.currentIndex = 0,
    this.correctAnswersCount = 0,
    this.secondsRemaining = 30,
    this.isFinished = false,
    this.finalScore = 0,
  });

  QuizState copyWith({
    List<QuizModel>? questions,
    int? currentIndex,
    int? correctAnswersCount,
    int? secondsRemaining,
    bool? isFinished,
    int? finalScore,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      correctAnswersCount: correctAnswersCount ?? this.correctAnswersCount,
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
      isFinished: isFinished ?? this.isFinished,
      finalScore: finalScore ?? this.finalScore,
    );
  }
}

class QuizNotifier extends Notifier<QuizState> {
  Timer? _timer;

  @override
  QuizState build() {
    // Properly dispose of timer when the notifier is destroyed
    ref.onDispose(() {
      _timer?.cancel();
    });

    // Start timer on build
    _startTimer();

    return QuizState(questions: QuizModel.generateDummyQuestions());
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.secondsRemaining > 1) {
        state = state.copyWith(secondsRemaining: state.secondsRemaining - 1);
      } else {
        _timer?.cancel();
        // Time ran out! Finish the quiz and calculate score.
        final score = _calculateScore(state.correctAnswersCount);
        state = state.copyWith(
          secondsRemaining: 0,
          isFinished: true,
          finalScore: score,
        );
      }
    });
  }

  int _calculateScore(int correctCount) {
    if (state.questions.isEmpty) return 0;
    return ((correctCount / state.questions.length) * 100).round();
  }

  void answerQuestion(int selectedIndex) {
    if (state.isFinished) return;

    final currentQuestion = state.questions[state.currentIndex];
    final isCorrect = selectedIndex == currentQuestion.correctOptionIndex;
    final newCorrectCount = isCorrect ? state.correctAnswersCount + 1 : state.correctAnswersCount;

    if (state.currentIndex < state.questions.length - 1) {
      // Go to next question
      state = state.copyWith(
        currentIndex: state.currentIndex + 1,
        correctAnswersCount: newCorrectCount,
      );
    } else {
      // Last question completed!
      _timer?.cancel();
      final score = _calculateScore(newCorrectCount);
      state = state.copyWith(
        correctAnswersCount: newCorrectCount,
        isFinished: true,
        finalScore: score,
      );
    }
  }

  void resetQuiz() {
    _timer?.cancel();
    state = QuizState(questions: QuizModel.generateDummyQuestions());
    _startTimer();
  }
}

// Modern NotifierProvider definition
final quizProvider = NotifierProvider.autoDispose<QuizNotifier, QuizState>(() {
  return QuizNotifier();
});
