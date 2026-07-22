import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify/features/shared/widgets/app_background_stack.dart';
import 'package:learnify/shared/widgets/bouncy_button.dart';
import 'package:flutter_animate/flutter_animate.dart';

class StoryDetailPage extends StatefulWidget {
  final String title;
  final Map<String, dynamic>? story;
  const StoryDetailPage({super.key, required this.title, this.story});

  @override
  State<StoryDetailPage> createState() => _StoryDetailPageState();
}

class _StoryDetailPageState extends State<StoryDetailPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _showSpeechBubble = false;

  final Map<String, List<Map<String, String>>> _stories = {
    'Si Kancil yang Cerdik': [
      {'emoji': '🦊', 'text': 'Awal: Kancil yang cerdik berjalan santai di pinggir sungai, tiba-tiba ia merasa sangat lapar!', 'guru': 'Ayo coba buat suara perut lapar: Krrr-krrr!'},
      {'emoji': '🦊', 'text': 'Konflik: Ia ingin menyeberang sungai untuk mencari makan, tapi banyak buaya yang menunggu!', 'guru': 'Wah, ada Buaya! Coba buat muka seram Buaya: Grrr!'},
      {'emoji': '🦊', 'text': 'Penyelesaian: Kancil menipu buaya dengan menghitung mereka, lalu melompat di atas punggung buaya satu per satu.', 'guru': 'Ayo kita hitung punggung buaya! Satu, dua, tiga...'},
      {'emoji': '🦊', 'text': 'Moral: Kecerdikan dapat membantu kita melewati tantangan sesulit apa pun.', 'guru': 'Hebat! Kancil berhasil menyeberang dengan selamat berkat akalnya.'},
    ],
    'Petualangan Awan Kecil': [
      {'emoji': '🐘', 'text': 'Awal: Awan kecil merasa kesepian di langit biru yang luas.', 'guru': 'Coba tunjuk ke atas, seberapa tinggi awan terbang?'},
      {'emoji': '🐘', 'text': 'Konflik: Tiba-tiba datang angin kencang yang meniup awan ke tempat asing.', 'guru': 'Ayo tiup sekencang mungkin seperti angin: Wuuuush!'},
      {'emoji': '🐘', 'text': 'Penyelesaian: Awan bertemu teman-teman baru dan menjadi awan hujan yang menyegarkan tanaman.', 'guru': 'Hujan turun! Ayo gerakkan jari kita seperti rintik hujan: Tik-tik-tik!'},
      {'emoji': '🐘', 'text': 'Moral: Pertemanan baru bisa memberikan kebahagiaan tak terduga.', 'guru': 'Bagus! Sekarang Awan jadi bahagia karena punya teman baru.'},
    ],
    'Bintang Pertamaku': [
      {'emoji': '🐦', 'text': 'Awal: Seekor burung kecil ingin terbang tinggi untuk menyentuh bintang.', 'guru': 'Coba kepakkan sayap kecilmu seperti burung! Hap-hap!'},
      {'emoji': '🐦', 'text': 'Konflik: Saat terbang tinggi, ia merasa lelah dan hampir terjatuh.', 'guru': 'Burung lelah, ayo kita berikan semangat: Semangat burung kecil!'},
      {'emoji': '🐦', 'text': 'Penyelesaian: Burung beristirahat di dahan pohon sebentar, lalu lanjut terbang hingga ke puncak tertinggi.', 'guru': 'Ayo kita tarik napas panjang untuk beristirahat: Huuu...'},
      {'emoji': '🐦', 'text': 'Moral: Jangan menyerah, teruslah berjuang untuk mencapai mimpi.', 'guru': 'Akhirnya burung sampai! Senang sekali rasanya mencapai mimpi.'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    // Fallback logic for story data if widget.story is null or lacks slides
    final slides = (widget.story?['slides'] as List?)?.cast<Map<String, String>>() ?? _stories[widget.title] ?? _stories.values.first;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: AppBackgroundStack(
        child: Column(
          children: [
            _buildCustomHeader(context, widget.title),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: slides.length,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemBuilder: (context, index) => _buildSlide(index, slides[index]),
              ),
            ),
            _buildFooter(slides.length),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 0),
      child: Row(
        children: [
          BouncyButton(
            onTap: () => context.pop(),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 4))]),
              child: const Icon(Icons.arrow_back, color: Color(0xFF0C6780)),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(child: Text(title, style: GoogleFonts.quicksand(fontSize: 24, fontWeight: FontWeight.bold, color: const Color(0xFF0C6780)))),
        ],
      ),
    );
  }

  String getSlideEmoji(String text) {
    final lower = text.toLowerCase();
    
    // Check by context (Story Title)
    if (widget.title == 'Si Kancil yang Cerdik') {
      if (lower.contains('buaya')) return '🐊';
      if (lower.contains('sungai') || lower.contains('air')) return '🌊';
      return '🦊';
    }
    
    if (widget.title == 'Petualangan Awan Kecil') {
      if (lower.contains('awan') || lower.contains('langit')) return '☁️';
      if (lower.contains('hujan')) return '🌧️';
      return '🐘';
    }
    
    if (widget.title == 'Bintang Pertamaku') {
      if (lower.contains('burung')) return '🐦';
      if (lower.contains('bintang')) return '⭐';
      return '✨';
    }

    return '📖'; // Default
  }

  Widget _buildSlide(int index, Map<String, String> slideData) {
    final emoji = getSlideEmoji(slideData['text']!);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            GestureDetector(
              onTap: () => setState(() => _showSpeechBubble = !_showSpeechBubble),
              child: Container(
                margin: const EdgeInsets.fromLTRB(24, 64, 24, 24),
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: const Color(0xFF4B53BC), width: 8),
                  boxShadow: const [BoxShadow(color: Color(0xFF4B53BC), offset: Offset(0, 16))],
                ),
                child: Text(emoji, style: const TextStyle(fontSize: 100)).animate().shake(),
              ),
            ),
            if (_showSpeechBubble)
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: const Color(0xFFFFB477), borderRadius: BorderRadius.circular(20)),
                child: Text('Halo adik-adik!', style: GoogleFonts.quicksand(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              ).animate().scale(),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.9), borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xFF0C6780), width: 2)),
          child: Text(slideData['text']!, textAlign: TextAlign.center, style: GoogleFonts.quicksand(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xFF0C6780))),
        ),
      ],
    );
  }

  Widget _buildFooter(int totalSlides) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: const Color(0xFFEBF5FF), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFF4FB6EC))),
            child: Text('💡 Panduan Guru: ${_stories[widget.title]![_currentPage]['guru']}', textAlign: TextAlign.center, style: GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xFF0C6780))),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed: () => _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut), child: const Text('Sebelumnya')),
              Text('${_currentPage + 1} / $totalSlides'),
              ElevatedButton(onPressed: () => _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut), child: const Text('Selanjutnya')),
            ],
          ),
        ],
      ),
    );
  }
}
