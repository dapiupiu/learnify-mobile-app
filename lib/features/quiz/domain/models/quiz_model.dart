class QuizModel {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;

  const QuizModel({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
  });

  // Generates 5 actual questions depending on the category and difficulty
  static List<QuizModel> generateDummyQuestions(String category, String difficulty) {
    final normalizedCategory = category.trim().toLowerCase();
    final normalizedDifficulty = difficulty.trim().toLowerCase();

    // Map Bahasa Category Questions
    if (normalizedCategory == 'bahasa') {
      if (normalizedDifficulty == 'mudah') {
        return const [
          QuizModel(
            questionText: "Huruf pertama untuk kata 'Apel' adalah?",
            options: ['A', 'B', 'C', 'O'],
            correctOptionIndex: 0, // A
          ),
          QuizModel(
            questionText: "Manakah yang termasuk huruf vokal?",
            options: ['B', 'D', 'I', 'F'],
            correctOptionIndex: 2, // I
          ),
          QuizModel(
            questionText: "Huruf setelah 'A' adalah?",
            options: ['B', 'C', 'D', 'E'],
            correctOptionIndex: 0, // B
          ),
          QuizModel(
            questionText: "Kata 'Ibu' diawali dengan huruf?",
            options: ['A', 'I', 'U', 'E'],
            correctOptionIndex: 1, // I
          ),
          QuizModel(
            questionText: "Manakah huruf yang berbunyi bulat seperti bola?",
            options: ['A', 'I', 'U', 'O'],
            correctOptionIndex: 3, // O
          ),
        ];
      } else if (normalizedDifficulty == 'sulit') {
        return const [
          QuizModel(
            questionText: "Ejaan kata 'B-U-K-U' yang benar adalah?",
            options: ['Baku', 'Buku', 'Buka', 'Beli'],
            correctOptionIndex: 1, // Buku
          ),
          QuizModel(
            questionText: "Ada berapa huruf vokal pada kata 'S-E-K-O-L-A-H'?",
            options: ['2', '3', '4', '5'],
            correctOptionIndex: 1, // 3 (e, o, a)
          ),
          QuizModel(
            questionText: "Manakah yang merupakan huruf konsonan?",
            options: ['A', 'E', 'K', 'I'],
            correctOptionIndex: 2, // K
          ),
          QuizModel(
            questionText: "Suku kata pertama dari 'Kucing' adalah?",
            options: ['Ku', 'Ci', 'Kuc', 'Ing'],
            correctOptionIndex: 0, // Ku
          ),
          QuizModel(
            questionText: "Kata manakah di bawah ini yang memiliki 5 huruf?",
            options: ['Meja', 'Kursi', 'Papan', 'Buku'],
            correctOptionIndex: 1, // Kursi
          ),
        ];
      } else {
        // Sedang (Default video context)
        return const [
          QuizModel(
            questionText: "Huruf 'A' pada video melambangkan buah apa?",
            options: ['Anggur', 'Apel', 'Alpukat', 'Arumanis'],
            correctOptionIndex: 1, // Apel
          ),
          QuizModel(
            questionText: "Benda apa yang ditunjukkan untuk huruf 'B'?",
            options: ['Balon', 'Boneka', 'Bis', 'Baju'],
            correctOptionIndex: 2, // Bis
          ),
          QuizModel(
            questionText: "Untuk huruf 'E', makanan apa yang ditampilkan?",
            options: ['Es krim', 'Emping', 'Eclair', 'Es campur'],
            correctOptionIndex: 0, // Es krim
          ),
          QuizModel(
            questionText: "Hewan apa yang mewakili huruf 'G'?",
            options: ['Gorila', 'Gajah', 'Gagak', 'Gurita'],
            correctOptionIndex: 1, // Gajah
          ),
          QuizModel(
            questionText: "Buah apa yang digunakan untuk huruf 'P'?",
            options: ['Pepaya', 'Pir', 'Pisang', 'Plum'],
            correctOptionIndex: 2, // Pisang
          ),
        ];
      }
    }

    // Map Matematika Category Questions
    if (normalizedCategory == 'matematika') {
      if (normalizedDifficulty == 'mudah') {
        return const [
          QuizModel(
            questionText: "Berapakah hasil dari 1 ditambah 1?",
            options: ['1', '2', '3', '4'],
            correctOptionIndex: 1, // 2
          ),
          QuizModel(
            questionText: "Angka manakah setelah angka 2?",
            options: ['1', '3', '4', '5'],
            correctOptionIndex: 1, // 3
          ),
          QuizModel(
            questionText: "Berapa jumlah jari tangan kanan normal kita?",
            options: ['3', '4', '5', '10'],
            correctOptionIndex: 2, // 5
          ),
          QuizModel(
            questionText: "Hitung jumlah balon ini: 🎈 🎈. Ada berapa balon?",
            options: ['1', '2', '3', '4'],
            correctOptionIndex: 1, // 2
          ),
          QuizModel(
            questionText: "Berapakah hasil dari 2 dikurang 1?",
            options: ['0', '1', '2', '3'],
            correctOptionIndex: 1, // 1
          ),
        ];
      } else if (normalizedDifficulty == 'sulit') {
        return const [
          QuizModel(
            questionText: "Berapakah hasil dari 3 ditambah 4?",
            options: ['5', '6', '7', '8'],
            correctOptionIndex: 2, // 7
          ),
          QuizModel(
            questionText: "Jika kamu punya 5 permen lalu dimakan 2, sisa berapa permenmu?",
            options: ['2', '3', '4', '5'],
            correctOptionIndex: 1, // 3
          ),
          QuizModel(
            questionText: "Berapakah angka ganjil antara 1 dan 5?",
            options: ['2', '3', '4', '6'],
            correctOptionIndex: 1, // 3
          ),
          QuizModel(
            questionText: "Urutan mundur yang benar setelah angka 3 adalah?",
            options: ['3, 4, 5', '3, 2, 1', '3, 1, 2', '3, 5, 4'],
            correctOptionIndex: 1, // 3, 2, 1
          ),
          QuizModel(
            questionText: "Manakah angka di bawah ini yang lebih besar dari 7?",
            options: ['5', '6', '7', '8'],
            correctOptionIndex: 3, // 8
          ),
        ];
      } else {
        // Sedang (Default video context)
        return const [
          QuizModel(
            questionText: 'Berapakah angka yang muncul pertama kali dalam video?',
            options: ['0', '1', '2', '3'],
            correctOptionIndex: 1, // 1
          ),
          QuizModel(
            questionText: 'Apa warna dari angka 2 yang ditampilkan dalam video?',
            options: ['Merah', 'Biru', 'Hijau', 'Kuning'],
            correctOptionIndex: 0, // Merah
          ),
          QuizModel(
            questionText: 'Berapakah angka setelah angka 4?',
            options: ['3', '5', '6', '7'],
            correctOptionIndex: 1, // 5
          ),
          QuizModel(
            questionText: 'Apa warna dari angka 8 dalam video?',
            options: ['Biru Muda', 'Ungu', 'Merah Muda', 'Hijau Muda'],
            correctOptionIndex: 0, // Biru Muda
          ),
          QuizModel(
            questionText: 'Angka berapakah yang muncul di akhir, sebelum video diulang?',
            options: ['8', '9', '10', '11'],
            correctOptionIndex: 2, // 10
          ),
        ];
      }
    }

    // Map Sains Category Questions
    if (normalizedCategory == 'sains') {
      if (normalizedDifficulty == 'mudah') {
        return const [
          QuizModel(
            questionText: "Warna apakah daun pohon pada umumnya?",
            options: ['Merah', 'Kuning', 'Hijau', 'Biru'],
            correctOptionIndex: 2, // Hijau
          ),
          QuizModel(
            questionText: "Warna apakah langit siang hari yang cerah?",
            options: ['Merah', 'Biru', 'Hitam', 'Hijau'],
            correctOptionIndex: 1, // Biru
          ),
          QuizModel(
            questionText: "Warna apakah buah pisang matang?",
            options: ['Merah', 'Kuning', 'Hijau', 'Ungu'],
            correctOptionIndex: 1, // Kuning
          ),
          QuizModel(
            questionText: "Hewan apa yang bersuara di malam hari dan bersinar di kegelapan?",
            options: ['Semut', 'Kunang-kunang', 'Kupu-kupu', 'Belalang'],
            correctOptionIndex: 1, // Kunang-kunang
          ),
          QuizModel(
            questionText: "Benda langit apa yang bersinar sangat panas di siang hari?",
            options: ['Bulan', 'Matahari', 'Bintang', 'Awan'],
            correctOptionIndex: 1, // Matahari
          ),
        ];
      } else if (normalizedDifficulty == 'sulit') {
        return const [
          QuizModel(
            questionText: "Jika warna Merah dicampur dengan Biru, menghasilkan warna?",
            options: ['Hijau', 'Ungu', 'Jingga', 'Cokelat'],
            correctOptionIndex: 1, // Ungu
          ),
          QuizModel(
            questionText: "Es jika dipanaskan di bawah terik matahari akan...",
            options: ['Membeku', 'Mencair', 'Menguap', 'Mengeras'],
            correctOptionIndex: 1, // Mencair
          ),
          QuizModel(
            questionText: "Bagian tumbuhan manakah yang bertugas menyerap air dari dalam tanah?",
            options: ['Daun', 'Akar', 'Batang', 'Bunga'],
            correctOptionIndex: 1, // Akar
          ),
          QuizModel(
            questionText: "Pencampuran warna Kuning dan Biru akan menghasilkan warna?",
            options: ['Merah', 'Hijau', 'Ungu', 'Jingga'],
            correctOptionIndex: 1, // Hijau
          ),
          QuizModel(
            questionText: "Hewan manakah yang bernapas dengan insang di dalam air?",
            options: ['Lumba-lumba', 'Ikan Mas', 'Kucing', 'Burung'],
            correctOptionIndex: 1, // Ikan Mas
          ),
        ];
      } else {
        // Sedang (Default video context)
        return const [
          QuizModel(
            questionText: 'Benda apa yang digunakan untuk contoh warna merah?',
            options: ['Tomat', 'Apel', 'Stroberi', 'Cabai'],
            correctOptionIndex: 1, // Apel
          ),
          QuizModel(
            questionText: 'Sayuran apa yang digunakan untuk menunjukkan warna hijau?',
            options: ['Bayam', 'Sawi', 'Brokoli', 'Kangkung'],
            correctOptionIndex: 2, // Brokoli
          ),
          QuizModel(
            questionText: 'Buah apa yang mewakili warna kuning dalam video?',
            options: ['Mangga', 'Lemon', 'Pisang', 'Nanas'],
            correctOptionIndex: 2, // Pisang
          ),
          QuizModel(
            questionText: 'Benda apakah yang berwarna putih di video tersebut?',
            options: ['Awan', 'Salju', 'Kertas', 'Susu'],
            correctOptionIndex: 0, // Awan
          ),
          QuizModel(
            questionText: 'Hewan apa yang digunakan untuk contoh warna hitam?',
            options: ['Kucing', 'Anjing', 'Burung Gagak', 'Semut'],
            correctOptionIndex: 2, // Burung Gagak
          ),
        ];
      }
    }

    // Map Fauna Category Questions
    if (normalizedCategory == 'fauna') {
      if (normalizedDifficulty == 'mudah') {
        return const [
          QuizModel(
            questionText: "Hewan apa yang bersuara 'Miau... Miau...'?",
            options: ['Anjing', 'Kucing', 'Sapi', 'Ayam'],
            correctOptionIndex: 1, // Kucing
          ),
          QuizModel(
            questionText: "Hewan manakah yang memiliki sayap dan bisa terbang?",
            options: ['Kucing', 'Burung', 'Ular', 'Kelinci'],
            correctOptionIndex: 1, // Burung
          ),
          QuizModel(
            questionText: "Berapa jumlah kaki seekor ayam?",
            options: ['2', '3', '4', '6'],
            correctOptionIndex: 0, // 2
          ),
          QuizModel(
            questionText: "Hewan apa yang melompat-lompat dan suka makan wortel?",
            options: ['Kucing', 'Kelinci', 'Sapi', 'Kambing'],
            correctOptionIndex: 1, // Kelinci
          ),
          QuizModel(
            questionText: "Hewan apa yang menghasilkan susu segar untuk anak-anak?",
            options: ['Sapi', 'Kucing', 'Ayam', 'Burung'],
            correctOptionIndex: 0, // Sapi
          ),
        ];
      } else if (normalizedDifficulty == 'sulit') {
        return const [
          QuizModel(
            questionText: "Hewan manakah yang termasuk hewan pemakan daging (karnivora)?",
            options: ['Sapi', 'Kambing', 'Harimau', 'Kelinci'],
            correctOptionIndex: 2, // Harimau
          ),
          QuizModel(
            questionText: "Burung hantu biasanya aktif dan mencari makan pada...",
            options: ['Pagi hari', 'Siang hari', 'Malam hari', 'Sore hari'],
            correctOptionIndex: 2, // Malam hari
          ),
          QuizModel(
            questionText: "Hewan apa yang merayap di dinding dan bisa memutuskan ekornya?",
            options: ['Katak', 'Cicak', 'Ular', 'Kadal'],
            correctOptionIndex: 1, // Cicak
          ),
          QuizModel(
            questionText: "Hewan berkantung yang suka melompat jauh adalah...",
            options: ['Kangguru', 'Koala', 'Panda', 'Harimau'],
            correctOptionIndex: 0, // Kangguru
          ),
          QuizModel(
            questionText: "Hewan apakah yang mengalami metamorfosis dari ulat menjadi bersayap indah?",
            options: ['Semut', 'Kupu-kupu', 'Kecoak', 'Lalat'],
            correctOptionIndex: 1, // Kupu-kupu
          ),
        ];
      } else {
        // Sedang (Default video context)
        return const [
          QuizModel(
            questionText: 'Hewan pertama apa yang ditemui saat bertualang di hutan?',
            options: ['Gajah', 'Singa', 'Harimau', 'Beruang'],
            correctOptionIndex: 1, // Singa
          ),
          QuizModel(
            questionText: 'Hewan apakah yang memiliki belalai panjang di video tersebut?',
            options: ['Badak', 'Gajah', 'Kuda Nil', 'Babi Hutan'],
            correctOptionIndex: 1, // Gajah
          ),
          QuizModel(
            questionText: 'Saat tiba di pantai, hewan apa yang bersembunyi di balik anemon?',
            options: ['Kuda Laut', 'Ikan Badut', 'Gurita', 'Bintang Laut'],
            correctOptionIndex: 1, // Ikan Badut
          ),
          QuizModel(
            questionText: 'Hewan apakah yang jalannya ke samping?',
            options: ['Udang', 'Kepiting', 'Cumi-cumi', 'Lobster'],
            correctOptionIndex: 1, // Kepiting
          ),
          QuizModel(
            questionText: 'Ikan apakah yang memiliki gigi tajam dan menyuruh lari di dalam laut?',
            options: ['Ikan Paus', 'Lumba-lumba', 'Ikan Hiu', 'Ikan Pari'],
            correctOptionIndex: 2, // Ikan Hiu
          ),
        ];
      }
    }

    // Default Fallback Bahasa Sedang
    return const [
      QuizModel(
        questionText: "Huruf 'A' pada video melambangkan buah apa?",
        options: ['Anggur', 'Apel', 'Alpukat', 'Arumanis'],
        correctOptionIndex: 1, // Apel
      ),
    ];
  }
}
