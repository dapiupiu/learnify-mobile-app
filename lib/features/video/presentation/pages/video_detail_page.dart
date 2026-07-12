import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VideoDetailPage extends StatelessWidget {
  final String videoId;

  const VideoDetailPage({
    super.key,
    required this.videoId,
  });

  // Mock database lookup based on ID
  static const Map<String, Map<String, dynamic>> videoDetailsMap = {
    '1': {
      'title': 'Mengenal Huruf Alfabet (A-Z)',
      'duration': '05:30',
      'category': 'Bahasa',
      'themeColor': Color(0xFF6C93CD),
      'description': 'Materi ini dirancang khusus untuk anak usia dini (PAUD/TK) agar dapat mengenal huruf vokal dan konsonan dengan cara bernyanyi dan menggunakan visualisasi objek berawalan huruf tersebut. Sangat direkomendasikan sebagai pembuka materi literasi.',
    },
    '2': {
      'title': 'Belajar Berhitung 1 sampai 10',
      'duration': '04:15',
      'category': 'Matematika',
      'themeColor': Color(0xFFB0D9B1),
      'description': 'Materi pengenalan angka dasar 1 sampai 10 menggunakan konsep menghitung buah-buahan yang muncul satu per satu di layar. Membantu anak menghubungkan angka dengan kuantitas objek secara nyata.',
    },
    '3': {
      'title': 'Mengenal Warna Dasar di Sekitar Kita',
      'duration': '03:45',
      'category': 'Sains',
      'themeColor': Color(0xFFF9D9C3),
      'description': 'Menjelaskan warna primer (Merah, Kuning, Biru) dan penerapannya pada benda-benda sekitar seperti balon, buah, dan mainan. Disertai dengan eksperimen sederhana pencampuran warna di dalam video.',
    },
    '4': {
      'title': 'Nama-Nama Hewan Jinak & Suaranya',
      'duration': '06:12',
      'category': 'Sains',
      'themeColor': Color(0xFFE5B8F4),
      'description': 'Petualangan mengenal hewan jinak yang biasa dipelihara di sekitar rumah (kucing, anjing, ayam, sapi). Anak-anak diajak mendengarkan suara hewan dan menirukannya secara interaktif.',
    },
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final video = videoDetailsMap[videoId] ?? {
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
                    // Video Player Mockup Container
                    Container(
                      width: double.infinity,
                      height: 220,
                      color: Colors.black.withValues(alpha: 0.05),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Play Icon Button
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: videoColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: videoColor.withValues(alpha: 0.3),
                                  blurRadius: 15,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.play_arrow_rounded,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          // Aspect ratio/HD tag
                          Positioned(
                            bottom: 12,
                            right: 12,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.6),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                video['duration'] as String,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Video Metadata & Description
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                  onPressed: () => context.push('/quiz/${video['title']}'),
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
}
