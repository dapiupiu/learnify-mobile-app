import '../../domain/repositories/video_repository.dart';

class VideoRepositoryMockImpl implements VideoRepository {
  static const List<Map<String, dynamic>> mockVideosData = [
    {
      'id': '1',
      'title': 'Mengenal Huruf Alfabet',
      // TODO: Isi manual dengan durasi video asli jika dibutuhkan
      'duration': '03:30',
      'category': 'Bahasa',
      'video_url': 'assets/videos/huruf.mp4',
      'description': 'Materi ini dirancang khusus untuk anak usia dini (PAUD/TK) agar dapat mengenal huruf vokal dan konsonan dengan cara bernyanyi dan menggunakan visualisasi objek berawalan huruf tersebut. Sangat direkomendasikan sebagai pembuka materi literasi.',
      'color_hex': 'FF6C93CD', // Pastel Blue
    },
    {
      'id': '2',
      'title': 'Belajar Berhitung 1-10',
      // TODO: Isi manual dengan durasi video asli jika dibutuhkan
      'duration': '02:11',
      'category': 'Matematika',
      'video_url': 'assets/videos/angka.mp4',
      'description': 'Materi pengenalan angka dasar 1 sampai 10 menggunakan konsep menghitung buah-buahan yang muncul satu per satu di layar. Membantu anak menghubungkan angka dengan kuantitas objek secara nyata.',
      'color_hex': 'FFB0D9B1', // Pastel Green
    },
    {
      'id': '3',
      'title': 'Mengenal Warna Dasar',
      // TODO: Isi manual dengan durasi video asli jika dibutuhkan
      'duration': '03:36',
      'category': 'Sains',
      'video_url': 'assets/videos/warna.mp4',
      'description': 'Menjelaskan warna primer (Merah, Kuning, Biru) dan penerapannya pada benda-benda sekitar seperti balon, buah, dan mainan. Disertai dengan eksperimen sederhana pencampuran warna di dalam video.',
      'color_hex': 'FFF9D9C3', // Pastel Orange
    },
    {
      'id': '4',
      'title': 'Nama Hewan & Suaranya',
      // TODO: Isi manual dengan durasi video asli jika dibutuhkan
      'duration': '05:28',
      'category': 'Fauna',
      'video_url': 'assets/videos/hewan.mp4',
      'description': 'Petualangan mengenal hewan jinak yang biasa dipelihara di sekitar rumah (kucing, anjing, ayam, sapi). Anak-anak diajak mendengarkan suara hewan dan menirukannya secara interaktif.',
      'color_hex': 'FFE5B8F4', // Pastel Purple
    },
  ];

  @override
  Future<List<Map<String, dynamic>>> fetchVideos() async {
    // Simulating small delay for loading state
    await Future.delayed(const Duration(milliseconds: 500));
    return mockVideosData;
  }
}
