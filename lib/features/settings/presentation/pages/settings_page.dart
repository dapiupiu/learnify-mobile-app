import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/services/local_storage_service.dart';
import '../../../home/presentation/controllers/home_controller.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  bool _soundEnabled = true;

  @override
  void initState() {
    super.initState();
    _soundEnabled = LocalStorageService().getSoundEnabled();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const primaryTextNavy = Color(0xFF2C3E50);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Pengaturan'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(24.0),
                children: [
                  // App Sounds Setting
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(
                        color: Colors.black.withValues(alpha: 0.05),
                        width: 1,
                      ),
                    ),
                    child: SwitchListTile(
                      value: _soundEnabled,
                      onChanged: (bool value) async {
                        setState(() {
                          _soundEnabled = value;
                        });
                        await LocalStorageService().saveSoundEnabled(value);
                      },
                      title: Text(
                        'Suara Aplikasi',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: primaryTextNavy,
                        ),
                      ),
                      subtitle: const Text('Aktifkan efek suara jawaban kuis'),
                      secondary: Icon(
                        _soundEnabled ? Icons.volume_up_rounded : Icons.volume_off_rounded,
                        color: theme.colorScheme.primary,
                      ),
                      activeTrackColor: theme.colorScheme.primary.withValues(alpha: 0.5),
                      activeThumbColor: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Reset High Score Setting
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(
                        color: Colors.black.withValues(alpha: 0.05),
                        width: 1,
                      ),
                    ),
                    child: ListTile(
                      onTap: () {
                        _showResetConfirmationDialog(context);
                      },
                      leading: Icon(
                        Icons.settings_backup_restore_rounded,
                        color: theme.colorScheme.error,
                      ),
                      title: Text(
                        'Reset Skor Kuis',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.error,
                        ),
                      ),
                      subtitle: const Text('Hapus riwayat skor tertinggi belajar'),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // About App Navigation
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(
                        color: Colors.black.withValues(alpha: 0.05),
                        width: 1,
                      ),
                    ),
                    child: ListTile(
                      onTap: () {
                        context.push('/about');
                      },
                      leading: Icon(
                        Icons.info_outline_rounded,
                        color: theme.colorScheme.primary,
                      ),
                      title: Text(
                        'Tentang Aplikasi',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: primaryTextNavy,
                        ),
                      ),
                      subtitle: const Text('Informasi detail dan kredit pengembang'),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showResetConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        final theme = Theme.of(context);
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: const Text('Reset Skor?'),
          content: const Text(
            'Apakah Anda yakin ingin menghapus semua pencapaian skor tertinggi? Tindakan ini tidak dapat dibatalkan.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(highScoreProvider.notifier).resetHighScore();
                Navigator.of(ctx).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Skor tertinggi berhasil direset ke 0.'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.error,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text('Ya, Reset'),
            ),
          ],
        );
      },
    );
  }
}
