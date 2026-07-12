class QuizModel {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;

  const QuizModel({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
  });

  // Generates 5 dummy IPA / basic learning questions for PAUD/TK
  static List<QuizModel> generateDummyQuestions() {
    return const [
      QuizModel(
        questionText: 'Manakah kata di bawah ini yang diawali dengan huruf vokal "A"?',
        options: ['Balon', 'Cacing', 'Apel', 'Domba'],
        correctOptionIndex: 2, // Apel
      ),
      QuizModel(
        questionText: 'Hewan manakah yang memiliki sayap dan bisa terbang tinggi?',
        options: ['Kucing', 'Burung', 'Sapi', 'Ikan'],
        correctOptionIndex: 1, // Burung
      ),
      QuizModel(
        questionText: 'Benda apa yang ada di langit pada malam hari dan bersinar terang?',
        options: ['Bintang', 'Matahari', 'Awan', 'Pelangi'],
        correctOptionIndex: 0, // Bintang
      ),
      QuizModel(
        questionText: 'Manakah dari hewan berikut yang hidup di dalam air?',
        options: ['Kelinci', 'Kambing', 'Ayam', 'Ikan'],
        correctOptionIndex: 3, // Ikan
      ),
      QuizModel(
        questionText: 'Warna apakah buah pisang yang sudah matang?',
        options: ['Merah', 'Kuning', 'Hijau', 'Biru'],
        correctOptionIndex: 1, // Kuning
      ),
    ];
  }
}
