import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/video_repository.dart';
import '../../data/repository_impl/video_repository_mock_impl.dart';

// Provider exposing the mock repository implementation
final videoRepositoryProvider = Provider<VideoRepository>((ref) {
  return VideoRepositoryMockImpl();
});

// Notifier controlling the video list loading states
class VideoListNotifier extends Notifier<AsyncValue<List<Map<String, dynamic>>>> {
  @override
  AsyncValue<List<Map<String, dynamic>>> build() {
    final repository = ref.watch(videoRepositoryProvider);
    _fetchVideos(repository);
    return const AsyncValue.loading();
  }

  Future<void> _fetchVideos(VideoRepository repository) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await repository.fetchVideos();
    });
  }
}

// Global provider for the reactive video list state
final videoListProvider = NotifierProvider.autoDispose<VideoListNotifier, AsyncValue<List<Map<String, dynamic>>>>(() {
  return VideoListNotifier();
});
