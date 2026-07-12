import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/app_background.dart';
import '../controllers/video_provider.dart';

class VideoListPage extends ConsumerWidget {
  const VideoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoListState = ref.watch(videoListProvider);

    return Scaffold(
      backgroundColor: Colors.transparent, // transparent so AppBackground shows
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Video Pembelajaran'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: AppBackground(
        child: SafeArea(
          child: videoListState.when(
            data: (videos) {
              if (videos.isEmpty) {
                return const Center(
                  child: Text('Belum ada video pembelajaran.'),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.all(24.0),
                itemCount: videos.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final video = videos[index];
                  return _buildVideoCard(context, video);
                },
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stackTrace) => Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  'Gagal memuat video: $error',
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVideoCard(BuildContext context, Map<String, dynamic> video) {
    final theme = Theme.of(context);
    const primaryTextNavy = Color(0xFF2C3E50); // Primary Text Color
    
    // Parse color_hex dynamically
    final colorHexStr = video['color_hex'] ?? 'FF6C93CD';
    final Color themeColor = Color(int.parse(colorHexStr, radix: 16));

    final videoId = video['id']?.toString() ?? '1';
    final title = video['title']?.toString() ?? 'Video';
    final duration = video['duration']?.toString() ?? '00:00';
    final category = video['category']?.toString() ?? 'Umum';

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => context.push('/videos/$videoId'),
        borderRadius: BorderRadius.circular(24.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Solid White Card
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: const Color(0xFFEBF5FF), // Subtle border
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06), // Soft but firm shadow
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Static Thumbnail Box
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: themeColor.withValues(alpha: 0.2),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    bottomLeft: Radius.circular(24.0),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.play_circle_outline_rounded,
                    size: 40,
                    color: themeColor,
                  ),
                ),
              ),
              // Video Details Text
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tag Kategori
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: themeColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          category,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: themeColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Judul Video
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: primaryTextNavy,
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Durasi Video (statis tiruan)
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time_rounded,
                            size: 14,
                            color: Colors.black38,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            duration,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: 12,
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
