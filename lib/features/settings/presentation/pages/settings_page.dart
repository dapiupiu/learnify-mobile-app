import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify/shared/widgets/shared_bottom_nav_bar.dart';
import 'package:learnify/core/app_state.dart';
import 'package:learnify/core/services/audio_service.dart';
import 'package:learnify/features/shared/widgets/app_background_stack.dart';
import 'package:learnify/shared/widgets/bouncy_button.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _appState = AppState();

  @override
  void initState() {
    super.initState();
    _appState.addListener(_updateUI);
  }

  @override
  void dispose() {
    _appState.removeListener(_updateUI);
    super.dispose();
  }

  void _updateUI() => setState(() {});

  static const Color primaryColor = Color(0xFF0c6780);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: AppBackgroundStack(
        child: Column(
          children: [
            _buildCustomHeader(context, 'Pengaturan'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 110),
                child: Column(
                  children: [
                    _buildProfileCard(),
                    const SizedBox(height: 24),
                    _buildToggleCard('Musik Latar', Icons.music_note, _appState.isMusicOn, (val) {
                      AudioService().toggleBgm(val);
                      setState(() {
                        // The AppState will update internally, 
                        // but we need to trigger a UI refresh if it's not already observing changes.
                      });
                    }),
                    const SizedBox(height: 16),
                    _buildToggleCard('Efek Suara', Icons.volume_up, _appState.isSoundOn, (val) {
                      _appState.toggleSound();
                      setState(() {});
                    }),
                    const SizedBox(height: 24),
                    _buildActionButton('Tentang Learnify', Icons.info, () => _showTentangLearnify(context)),
                    const SizedBox(height: 16),
                    _buildActionButton('Panduan Guru', Icons.menu_book, () => _showPanduanGuru(context)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SharedBottomNavBar(currentIndex: 3),
    );
  }

  Widget _buildCustomHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 0),
      child: Row(
        children: [
          BouncyButton(
            onTap: () { if (context.canPop()) context.pop(); else context.go('/main-dashboard'); },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 4))]),
              child: const Icon(Icons.arrow_back, color: primaryColor),
            ),
          ),
          const SizedBox(width: 16),
          Text(title, style: GoogleFonts.quicksand(fontSize: 24, fontWeight: FontWeight.bold, color: primaryColor)),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return GestureDetector(
      onTap: () => _showEditProfileDialog(context),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: primaryColor, width: 8),
          boxShadow: const [BoxShadow(color: primaryColor, offset: Offset(0, 16))],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white, width: 4),
              ),
              child: const Icon(Icons.face, color: Colors.amber, size: 48),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Kelas/Kelompok:', style: GoogleFonts.quicksand(fontSize: 16, color: primaryColor)),
                  Text(_appState.childName, style: GoogleFonts.quicksand(fontSize: 28, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const Icon(Icons.edit, color: primaryColor),
          ],
        ),
      ),
    );
  }

  void _showEditProfileDialog(BuildContext context) {
    final controller = TextEditingController(text: _appState.childName);
    showDialog(context: context, builder: (context) => AlertDialog(title: const Text('Edit Profil'), content: TextField(controller: controller, decoration: const InputDecoration(hintText: 'Masukkan nama baru')), actions: [TextButton(onPressed: () { _appState.childName = controller.text; context.pop(); }, child: const Text('Simpan'))]));
  }

  Widget _buildToggleCard(String title, IconData icon, bool value, Function(bool) onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: primaryColor, width: 4),
        boxShadow: const [BoxShadow(color: primaryColor, offset: Offset(0, 8))],
      ),
      child: Row(
        children: [
          Icon(icon, color: primaryColor),
          const SizedBox(width: 16),
          Expanded(child: Text(title, style: GoogleFonts.quicksand(fontSize: 18, fontWeight: FontWeight.bold))),
          Switch(value: value, onChanged: onChanged, activeColor: primaryColor),
        ],
      ),
    );
  }

  Widget _buildActionButton(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), border: Border.all(color: primaryColor, width: 2), boxShadow: const [BoxShadow(color: primaryColor, offset: Offset(0, 4))]),
        child: Row(children: [Icon(icon, color: primaryColor), const SizedBox(width: 16), Expanded(child: Text(title, style: GoogleFonts.quicksand(fontSize: 18, fontWeight: FontWeight.bold))), const Icon(Icons.chevron_right, color: primaryColor)]),
      ),
    );
  }

  void _showPanduanGuru(BuildContext context) {
    showDialog(context: context, builder: (context) => AlertDialog(title: const Text('Panduan Guru'), content: const Text('Aplikasi ini dirancang sebagai modul pembelajaran interaktif untuk anak TK/PAUD. Tujuannya adalah untuk menstimulasi aspek kognitif, motorik, dan kreativitas anak melalui video edukatif, kuis interaktif, dan teknologi Augmented Reality (AR) yang menyenangkan.'), actions: [TextButton(onPressed: () => context.pop(), child: const Text('Tutup'))]));
  }

  void _showTentangLearnify(BuildContext context) {
    showDialog(context: context, builder: (context) => AlertDialog(title: const Text('Tentang Learnify'), content: const Text('Learnify adalah platform pembelajaran interaktif berbasis AR untuk anak usia dini.\n\nDeskripsi: Menggabungkan elemen visual 3D, konten audio-visual edukatif, dan kuis interaktif.\n\nTarget User: Anak usia dini (TK/PAUD), pendidik.\n\nKelebihan: Pengalaman belajar imersif yang meningkatkan retensi informasi.\n\nSaran Pengembangan: Penambahan modul bahasa asing dan integrasi pelaporan perkembangan belajar anak.'), actions: [TextButton(onPressed: () => context.pop(), child: const Text('Tutup'))]));
  }
}
