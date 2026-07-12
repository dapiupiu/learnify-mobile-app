import 'package:flutter/foundation.dart';
import 'package:audioplayers/audioplayers.dart';
import 'local_storage_service.dart';

class AudioService {
  // Private Constructor
  AudioService._internal();

  // Static Instance
  static final AudioService _instance = AudioService._internal();

  // Factory Constructor
  factory AudioService() => _instance;

  // Separate AudioPlayer instances for preloading correct/wrong sounds
  final AudioPlayer _correctPlayer = AudioPlayer();
  final AudioPlayer _wrongPlayer = AudioPlayer();

  /// Preloads correct.mp3 and wrong.mp3 in the background to memory (RAM)
  Future<void> initialize() async {
    try {
      await _correctPlayer.setSource(AssetSource('audio/correct.mp3'));
      await _wrongPlayer.setSource(AssetSource('audio/wrong.mp3'));
    } catch (e) {
      debugPrint('AudioService: Error preloading sound assets: $e');
    }
  }

  /// Plays the preloaded correct answer sound effect
  Future<void> playCorrectSound() async {
    if (!LocalStorageService().getSoundEnabled()) return;
    try {
      await _correctPlayer.stop();
      await _correctPlayer.play(AssetSource('audio/correct.mp3'));
    } catch (e) {
      debugPrint('AudioService: Error playing correct sound: $e');
    }
  }

  /// Plays the preloaded wrong answer sound effect
  Future<void> playWrongSound() async {
    if (!LocalStorageService().getSoundEnabled()) return;
    try {
      await _wrongPlayer.stop();
      await _wrongPlayer.play(AssetSource('audio/wrong.mp3'));
    } catch (e) {
      debugPrint('AudioService: Error playing wrong sound: $e');
    }
  }

  // Clean up player resources
  void dispose() {
    _correctPlayer.dispose();
    _wrongPlayer.dispose();
  }
}
