import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/repositories/video_repository.dart';

class VideoRepositoryImpl implements VideoRepository {
  final SupabaseClient _supabaseClient;

  // Constructor with SupabaseClient dependency injection
  VideoRepositoryImpl(this._supabaseClient);

  @override
  Future<List<Map<String, dynamic>>> fetchVideos() async {
    try {
      // Fetching records from the 'videos' table ordered by creation time
      final response = await _supabaseClient
          .from('videos')
          .select()
          .order('created_at', ascending: false);

      // Convert response list of dynamic/map elements into List<Map<String, dynamic>>
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      // Standard production error logging/handling blueprint
      throw Exception('Error fetching videos from database: $e');
    }
  }
}
