abstract class VideoRepository {
  /// Fetches the list of all videos from the database.
  Future<List<Map<String, dynamic>>> fetchVideos();
}
