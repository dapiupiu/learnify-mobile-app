import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  // Private Constructor
  LocalStorageService._internal();

  // Static Instance
  static final LocalStorageService _instance = LocalStorageService._internal();

  // Factory Constructor
  factory LocalStorageService() => _instance;

  SharedPreferences? _prefs;

  // Initialize service at startup
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static const String _highScoreKey = 'high_score';
  static const String _soundEnabledKey = 'sound_enabled';

  /// Saves the high score to local storage.
  Future<void> saveHighScore(int score) async {
    await _prefs?.setInt(_highScoreKey, score);
  }

  /// Retrieves the current high score from local storage.
  int getHighScore() {
    return _prefs?.getInt(_highScoreKey) ?? 0;
  }

  /// Clears the high score from local storage.
  Future<void> clearHighScore() async {
    await _prefs?.remove(_highScoreKey);
  }

  /// Saves the sound enabled status to local storage.
  Future<void> saveSoundEnabled(bool enabled) async {
    await _prefs?.setBool(_soundEnabledKey, enabled);
  }

  /// Retrieves the sound enabled status from local storage.
  bool getSoundEnabled() {
    return _prefs?.getBool(_soundEnabledKey) ?? true;
  }
}
