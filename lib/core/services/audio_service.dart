import 'package:flutter/foundation.dart';
import 'package:audioplayers/audioplayers.dart';
import 'local_storage_service.dart';

class AudioService {
  AudioService._internal();
  static final AudioService _instance = AudioService._internal();
  factory AudioService() => _instance;

  final AudioPlayer _correctPlayer = AudioPlayer();
  final AudioPlayer _wrongPlayer = AudioPlayer();
  final AudioPlayer _bgmPlayer = AudioPlayer();
  final AudioPlayer _clickPlayer = AudioPlayer();

  bool _isFirstInteraction = true;

  // Helper to ensure correct asset path resolution for web with fallback
  String _getAssetPath(String path) {
    return path.replaceFirst('assets/', '');
  }

  Future<void> handleFirstInteraction() async {
    if (_isFirstInteraction) {
      _isFirstInteraction = false;
      await startBgmIfEnabled();
    }
  }

  Future<void> startBgmIfEnabled() async {
    final bgmEnabled = LocalStorageService().getMusicEnabled();
    if (bgmEnabled) {
      try {
        await _bgmPlayer.setReleaseMode(ReleaseMode.loop);
        await _bgmPlayer.play(AssetSource(_getAssetPath('audio/bgm_education.mp3')));
      } catch (e, stack) {
        debugPrint('AudioService: Error playing BGM: $e\n$stack');
      }
    }
  }

  Future<void> initialize() async {
    try {
      final localStorage = LocalStorageService();
      final sfxEnabled = localStorage.getSoundEnabled();

      debugPrint('AudioService: Initialized with SFX: $sfxEnabled');

      // Preload all assets
      await _correctPlayer.setSource(AssetSource(_getAssetPath('audio/correct.mp3')));
      await _wrongPlayer.setSource(AssetSource(_getAssetPath('audio/wrong.mp3')));
      await _clickPlayer.setSource(AssetSource(_getAssetPath('audio/click_sfx.mp3')));
      await _bgmPlayer.setSource(AssetSource(_getAssetPath('audio/bgm_education.mp3')));
      await _bgmPlayer.setReleaseMode(ReleaseMode.loop);
    } catch (e, stack) {
      debugPrint('AudioService: Error preloading assets: $e\n$stack');
    }
  }

  Future<void> pauseBgm() async {
    try {
      await _bgmPlayer.pause();
    } catch (e, stack) {
      debugPrint('AudioService: Error pausing BGM: $e\n$stack');
    }
  }

  Future<void> resumeBgm() async {
    final bgmEnabled = LocalStorageService().getMusicEnabled();
    if (!bgmEnabled) return;
    try {
      await _bgmPlayer.resume();
    } catch (e, stack) {
      debugPrint('AudioService: Error resuming BGM: $e\n$stack');
    }
  }

  Future<void> playBgm() async {
    final bgmEnabled = LocalStorageService().getMusicEnabled();
    if (!bgmEnabled) return;
    try {
      await _bgmPlayer.setReleaseMode(ReleaseMode.loop);
      await _bgmPlayer.resume();
    } catch (e, stack) {
      debugPrint('AudioService: Error playing BGM: $e\n$stack');
    }
  }

  Future<void> playClickSfx() async {
    final sfxEnabled = LocalStorageService().getSoundEnabled();
    if (!sfxEnabled) return;
    try {
      await _clickPlayer.stop();
      await _clickPlayer.play(AssetSource(_getAssetPath('audio/click_sfx.mp3')));
    } catch (e, stack) {
      debugPrint('AudioService: Error playing click SFX: $e\n$stack');
    }
  }

  Future<void> toggleBgm(bool val) async {
    await LocalStorageService().saveMusicEnabled(val);
    if (val) {
      await _bgmPlayer.setReleaseMode(ReleaseMode.loop);
      await _bgmPlayer.resume();
    } else {
      await _bgmPlayer.pause();
    }
  }

  Future<void> playCorrectSound() async {
    if (!LocalStorageService().getSoundEnabled()) return;
    try {
      await _correctPlayer.stop();
      await _correctPlayer.play(AssetSource(_getAssetPath('audio/correct.mp3')));
    } catch (e, stack) {
      debugPrint('AudioService: Error playing correct sound: $e\n$stack');
    }
  }

  Future<void> playWrongSound() async {
    if (!LocalStorageService().getSoundEnabled()) return;
    try {
      await _wrongPlayer.stop();
      await _wrongPlayer.play(AssetSource(_getAssetPath('audio/wrong.mp3')));
    } catch (e, stack) {
      debugPrint('AudioService: Error playing wrong sound: $e\n$stack');
    }
  }

  void dispose() {
    _correctPlayer.dispose();
    _wrongPlayer.dispose();
    _bgmPlayer.dispose();
    _clickPlayer.dispose();
  }
}
