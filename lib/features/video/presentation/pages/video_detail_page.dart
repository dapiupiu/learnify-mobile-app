import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:learnify/core/services/audio_service.dart';
import 'package:learnify/shared/widgets/lego_card.dart';
import 'package:learnify/shared/widgets/bouncy_button.dart';
import 'package:learnify/shared/widgets/floating_clouds.dart';
import 'package:learnify/core/utils/route_observer.dart';

class VideoDetailPage extends StatefulWidget {
  final String videoId;

  const VideoDetailPage({
    super.key,
    required this.videoId,
  });

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> 
    with RouteAware, WidgetsBindingObserver {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _hasError = false;
  bool _wasBgmPlaying = false;

  // Mock database lookup based on ID, using offline asset videos
  static const Map<String, Map<String, dynamic>> videoDetailsMap = {
    '1': {
      'title': 'Mengenal Huruf Alfabet',
      'duration': '05:30',
      'category': 'Bahasa',
      'themeColor': Color(0xFF6C93CD),
      'video_url': 'assets/videos/huruf.mp4',
      'description': 'Video ini bertujuan membantu anak mengenali bentuk dan suara huruf. Guru dapat memandu siswa untuk menirukan pelafalan setiap huruf yang muncul di layar dan mengaitkannya dengan benda di sekitar kelas.',
    },
    '2': {
      'title': 'Belajar Berhitung 1-10',
      'duration': '04:15',
      'category': 'Matematika',
      'themeColor': Color(0xFFB0D9B1),
      'video_url': 'assets/videos/angka.mp4',
      'description': 'Video ini dirancang untuk mengajarkan konsep angka dasar dan berhitung sederhana. Guru dapat berinteraksi dengan meminta siswa menghitung objek yang muncul bersamaan dengan angka di layar.',
    },
    '3': {
      'title': 'Mengenal Warna Dasar',
      'duration': '03:45',
      'category': 'Sains',
      'themeColor': Color(0xFFF9D9C3),
      'video_url': 'assets/videos/warna.mp4',
      'description': 'Video ini bertujuan mengenalkan warna-warna dasar pada benda di lingkungan sekitar. Guru dapat mengajak siswa untuk mencari benda di dalam kelas yang memiliki warna serupa dengan yang ditampilkan.',
    },
    '4': {
      'title': 'Nama Hewan & Suaranya',
      'duration': '06:12',
      'category': 'Fauna',
      'themeColor': Color(0xFFE5B8F4),
      'video_url': 'assets/videos/hewan.mp4',
      'description': 'Video ini bertujuan mengenalkan berbagai jenis hewan beserta suaranya. Guru dapat mengajak siswa untuk menirukan suara hewan yang muncul sebagai bentuk interaksi aktif.',
    },
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializePlayer();
  }

  void _initializePlayer() async {
    final video = videoDetailsMap[widget.videoId] ?? {};
    final String videoPath = video['video_url'] ?? 'assets/videos/huruf.mp4';
    final Color videoColor = video['themeColor'] as Color? ?? Colors.blue;

    try {
      _videoPlayerController = VideoPlayerController.asset(videoPath);
      // Wait for initialization
      await _videoPlayerController!.initialize();
      
      // Update UI after initialization
      if (mounted) setState(() {}); 

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        aspectRatio: _videoPlayerController!.value.aspectRatio,
        autoPlay: false,
        looping: false,
        showControls: true,
        materialProgressColors: ChewieProgressColors(
          playedColor: videoColor,
          handleColor: videoColor,
          backgroundColor: Colors.white24,
          bufferedColor: Colors.white54,
        ),
      );
      
      _videoPlayerController!.addListener(_videoListener);

    } catch (e) {
      debugPrint('Error initializing video player: $e');
      if (mounted) {
        setState(() {
          _hasError = true;
        });
      }
    }
  }

  void _videoListener() {
    if (_videoPlayerController!.value.isPlaying) {
      if (!_wasBgmPlaying) {
        _wasBgmPlaying = true;
        AudioService().pauseBgm();
      }
    } else {
      if (_wasBgmPlaying) {
        AudioService().resumeBgm();
        _wasBgmPlaying = false;
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) {
      _videoPlayerController?.pause();
    }
  }

  @override
  void didPushNext() {
    _videoPlayerController?.pause();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    routeObserver.unsubscribe(this);
    AudioService().resumeBgm();
    _videoPlayerController?.removeListener(_videoListener);
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
      backgroundColor: const Color(0xFFE0F2FE),
      body: Stack(
        children: [
          const FloatingClouds(),
          SafeArea(
            child: Column(
              children: [
                // Custom App Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      BouncyButton(
                        onTap: () {
                          AudioService().playClickSfx();
                          context.pop();
                        },
                        child: const Icon(Icons.arrow_back, color: Color(0xFF0c6780), size: 32),
                      ),
                      const SizedBox(width: 16),
                      const Text('Detail Materi', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0c6780))),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Video Player Area
                          LegoCard(
                            padding: EdgeInsets.zero,
                            bgColor: Colors.black,
                            borderColor: videoColor,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: AspectRatio(
                                aspectRatio: _videoPlayerController?.value.aspectRatio ?? 16 / 9,
                                child: _buildVideoWidget(videoColor),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          
                          // Video Metadata & Description
                          LegoCard(
                            borderColor: videoColor,
                            bgColor: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  video['title'] as String,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0c6780),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  video['description'] as String,
                                  style: const TextStyle(
                                    color: Color(0xFF7d4200),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                // Bottom Action Area
                Container(
                  padding: const EdgeInsets.all(24.0),
                  child: BouncyButton(
                    onTap: () {
                      AudioService().playClickSfx();
                      context.push('/quiz/${video['category']}/Sedang');
                    },
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFFffb477),
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(color: const Color(0xFF904d00), width: 4),
                        boxShadow: [const BoxShadow(color: Color(0xFF904d00), offset: Offset(0, 8))],
                      ),
                      child: const Center(
                        child: Text(
                          'Mulai Kuis',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF904d00),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
