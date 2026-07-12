import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  // Private Constructor
  SupabaseService._internal();

  // Static Instance
  static final SupabaseService _instance = SupabaseService._internal();

  // Factory Constructor
  factory SupabaseService() => _instance;

  // Supabase Client
  late final SupabaseClient client;

  // Initialize Service
  Future<void> initialize() async {
    final url = dotenv.env['SUPABASE_URL'] ?? '';
    final anonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';

    // Check if configuration is missing (only warning or throw depending on environment)
    if (url.isEmpty || anonKey.isEmpty) {
      throw Exception('SUPABASE_URL or SUPABASE_ANON_KEY is missing from .env file.');
    }

    final supabase = await Supabase.initialize(
      url: url,
      publishableKey: anonKey,
    );
    
    client = supabase.client;
  }
}
