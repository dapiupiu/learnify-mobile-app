import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoDetailPage extends StatefulWidget {
  final String videoId;

  const VideoDetailPage({
    super.key,
    required this.videoId,
  });

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _hasError = false;
  String _actualDuration = '00:00'; // Reactive actual duration state

  // Mock database lookup based on ID, using offline asset videos
  static const Map<String, Map<String, dynamic>> videoDetailsMap = {
    '1': {
      'title': 'Mengenal Huruf Alfabet',
      'duration': '05:30',
      'category': 'Bahasa',
      'themeColor': Color(0xFF6C93CD),
      'video_url': 'assets/videos/huruf.mp4',
      'description': 'Materi ini dirancang khusus untuk anak usia dini (PAUD/TK) agar dapat mengenal huruf vokal dan konsonan dengan cara bernyanyi dan menggunakan visualisasi objek berawalan huruf tersebut. Sangat direkomendasikan sebagai pembuka materi literasi.',
    },
    '2': {
      'title': 'Belajar Berhitung 1-10',
      'duration': '04:15',
      'category': 'Matematika',
      'themeColor': Color(0xFFB0D9B1),
      'video_url': 'assets/videos/angka.mp4',
      'description': 'Materi pengenalan angka dasar 1 sampai 10 menggunakan konsep menghitung buah-buahan yang muncul satu per satu di layar. Membantu anak menghubungkan angka dengan kuantitas objek secara nyata.',
    },
    '3': {
      'title': 'Mengenal Warna Dasar',
      'duration': '03:45',
      'category': 'Sains',
      'themeColor': Color(0xFFF9D9C3),
      'video_url': 'assets/videos/warna.mp4',
      'description': 'Menjelaskan warna primer (Merah, Kuning, Biru) dan penerapannya pada benda-benda sekitar seperti balon, buah, dan mainan. Disertai dengan eksperimen sederhana pencampuran warna di dalam video.',
    },
    '4': {
      'title': 'Nama Hewan & Suaranya',
      'duration': '06:12',
      'category': 'Fauna',
      'themeColor': Color(0xFFE5B8F4),
      'video_url': 'assets/videos/hewan.mp4',
      'description': 'Petualangan mengenal hewan jinak yang biasa dipelihara di sekitar rumah (kucing, anjing, ayam, sapi). Anak-anak diajak mendengarkan suara hewan dan menirukannya secara interaktif.',
    },
  };

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  void _initializePlayer() async {
    final video = videoDetailsMap[widget.videoId] ?? {};
    final String videoPath = video['video_url'] ?? 'assets/videos/huruf.mp4';

    try {
      _videoPlayerController = VideoPlayerController.asset(videoPath);
      await _videoPlayerController!.initialize();
      
      // Extract actual duration dynamically and format as MM:SS
      final duration = _videoPlayerController!.value.duration;
      final minutes = duration.inMinutes.toString().padLeft(2, '0');
      final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
      
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        aspectRatio: _videoPlayerController!.value.aspectRatio,
        autoPlay: false,
        looping: false,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      );
      if (mounted) {
        setState(() {
          _actualDuration = '$minutes:$seconds';
        });
      }
    } catch (e) {
      debugPrint('Error initializing video player: $e');
      if (mounted) {
        setState(() {
          _hasError = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final video = videoDetailsMap[widget.videoId] ?? {
      'title': 'Video Pembelajaran',
      'duration': '00:00',
      'category': 'Umum',
      'themeColor': theme.colorScheme.primary,
      'description': 'Deskripsi materi pembelajaran tidak ditemukan.',
    };

    final Color videoColor = video['themeColor'] as Color;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Detail Materi'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Video Player Area
                    Container(
                      width: double.infinity,
                      height: 220,
                      color: Colors.black,
                      child: _buildVideoWidget(videoColor),
                    ),
                    
                    // Video Metadata & Description
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // Category Badge
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                  vertical: 6.0,
                                ),
                                decoration: BoxDecoration(
                                  color: videoColor.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  video['category'] as String,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: videoColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              // Actual Dynamic Duration Badge
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                  vertical: 6.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.access_time_rounded,
                                      size: 14,
                                      color: Colors.black54,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      _actualDuration,
                                      style: theme.textTheme.bodyMedium?.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          
                          // Title
                          Text(
                            video['title'] as String,
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 16),
                          
                          // Divider
                          Divider(color: Colors.black.withValues(alpha: 0.05)),
                          const SizedBox(height: 16),
                          
                          // Section Title
                          Text(
                            'Deskripsi Pembelajaran',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          
                          // Description Text
                          Text(
                            video['description'] as String,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: Colors.black54,
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Bottom Action Area
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to QuizPage, passing the video category and default Sedang difficulty
                    context.push('/quiz/${video['category']}/Sedang');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Mulai Kuis',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoWidget(Color videoColor) {
    if (_hasError) {
      return const Center(
        child: Text(
          'Gagal memuat video offline. Pastikan aset video terpasang dengan benar.',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      );
    }

    final chewie = _chewieController;
    final player = _videoPlayerController;

    if (chewie != null && player != null && player.value.isInitialized) {
      return Chewie(controller: chewie);
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: videoColor,
          ),
          const SizedBox(height: 16),
          const Text(
            'Menyiapkan pemutar video offline...',
            style: TextStyle(color: Colors.white60, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
