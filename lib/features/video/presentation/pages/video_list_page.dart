import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VideoItem {
  final String id;
  final String title;
  final String duration;
  final String category;
  final Color themeColor;

  const VideoItem({
    required this.id,
    required this.title,
    required this.duration,
    required this.category,
    required this.themeColor,
  });
}

class VideoListPage extends StatelessWidget {
  const VideoListPage({super.key});

  static const List<VideoItem> mockVideos = [
    VideoItem(
      id: '1',
      title: 'Mengenal Huruf Alfabet (A-Z)',
      duration: '05:30',
      category: 'Bahasa',
      themeColor: Color(0xFF6C93CD), // Pastel Blue
    ),
    VideoItem(
      id: '2',
      title: 'Belajar Berhitung 1 sampai 10',
      duration: '04:15',
      category: 'Matematika',
      themeColor: Color(0xFFB0D9B1), // Pastel Green
    ),
    VideoItem(
      id: '3',
      title: 'Mengenal Warna Dasar di Sekitar Kita',
      duration: '03:45',
      category: 'Sains',
      themeColor: Color(0xFFF9D9C3), // Pastel Orange
    ),
    VideoItem(
      id: '4',
      title: 'Nama-Nama Hewan Jinak & Suaranya',
      duration: '06:12',
      category: 'Sains',
      themeColor: Color(0xFFE5B8F4), // Pastel Purple
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Video Pembelajaran'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(24.0),
          itemCount: mockVideos.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final video = mockVideos[index];
            return _buildVideoCard(context, video);
          },
        ),
      ),
    );
  }

  Widget _buildVideoCard(BuildContext context, VideoItem video) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => context.push('/videos/${video.id}'),
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Colors.black.withValues(alpha: 0.03),
              width: 1.0,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Static Thumbnail Box
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: video.themeColor.withValues(alpha: 0.2),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    bottomLeft: Radius.circular(16.0),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.play_circle_outline_rounded,
                    size: 40,
                    color: video.themeColor,
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
                          color: video.themeColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          video.category,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: video.themeColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Judul
                      Text(
                        video.title,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          height: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      // Durasi
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            size: 14,
                            color: Colors.black.withValues(alpha: 0.4),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            video.duration,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: 12,
                              color: Colors.black.withValues(alpha: 0.4),
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
