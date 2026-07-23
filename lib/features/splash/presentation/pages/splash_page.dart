import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:learnify/core/services/audio_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      if (mounted) context.go('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFE0F2FE),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
                ),
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/images/mascot.png'),
              ),
              const SizedBox(height: 32),
              Text('Learnify', style: GoogleFonts.quicksand(fontSize: 48, fontWeight: FontWeight.bold, color: const Color(0xFF0C6780))),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text('Jelajahi Dunia Belajar Interaktif & Seru dalam AR!', textAlign: TextAlign.center, style: GoogleFonts.quicksand(fontSize: 18, color: const Color(0xFF0C6780).withOpacity(0.9))),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  backgroundColor: const Color(0xFF0C6780).withOpacity(0.2),
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF0C6780)),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
