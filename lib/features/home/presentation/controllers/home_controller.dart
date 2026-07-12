import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/local_storage_service.dart';

class HighScoreNotifier extends Notifier<int> {
  @override
  int build() {
    return LocalStorageService().getHighScore();
  }

  /// Updates high score in state and local storage if the new score is higher
  void updateHighScore(int newScore) {
    if (newScore > state) {
      state = newScore;
      LocalStorageService().saveHighScore(newScore);
    }
  }

  /// Resets high score to 0 in state and local storage
  void resetHighScore() {
    state = 0;
    LocalStorageService().clearHighScore();
  }
}

// Global provider for high score
final highScoreProvider = NotifierProvider<HighScoreNotifier, int>(() {
  return HighScoreNotifier();
});
