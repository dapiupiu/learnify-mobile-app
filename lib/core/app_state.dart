import 'package:flutter/material.dart';
import 'services/local_storage_service.dart';

class AppState extends ChangeNotifier {
  static final AppState _instance = AppState._internal();
  factory AppState() => _instance;
  AppState._internal();

  final _storage = LocalStorageService();

  String get childName => _storage.getUsername();
  bool get isMusicOn => _storage.getMusicEnabled();
  bool get isSoundOn => _storage.getSoundEnabled();

  set childName(String name) {
    _storage.saveUsername(name);
    notifyListeners();
  }

  void toggleMusic() {
    _storage.saveMusicEnabled(!isMusicOn);
    notifyListeners();
  }

  void toggleSound() {
    _storage.saveSoundEnabled(!isSoundOn);
    notifyListeners();
  }
}
