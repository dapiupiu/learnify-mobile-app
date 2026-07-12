import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app.dart';
import 'core/services/supabase_service.dart';
import 'core/services/local_storage_service.dart';
import 'core/services/audio_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  try {
    await dotenv.load(fileName: '.env');
  } catch (e) {
    debugPrint('Dotenv Load Error: $e');
  }

  // Initialize Supabase Service
  try {
    await SupabaseService().initialize();
  } catch (e) {
    debugPrint('Supabase Init Error: $e');
  }

  // Initialize Local Storage Service
  try {
    await LocalStorageService().initialize();
  } catch (e) {
    debugPrint('LocalStorage Init Error: $e');
  }

  // Initialize Audio Service (Preloads audio files for zero-latency)
  try {
    await AudioService().initialize();
  } catch (e) {
    debugPrint('AudioService Init Error: $e');
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
