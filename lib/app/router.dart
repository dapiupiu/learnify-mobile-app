import 'package:go_router/go_router.dart';
import '../features/splash/presentation/pages/splash_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/video/presentation/pages/video_list_page.dart';
import '../features/video/presentation/pages/video_detail_page.dart';
import '../features/quiz/presentation/pages/quiz_page.dart';
import '../features/quiz/presentation/pages/quiz_result_page.dart';
import '../features/ar/presentation/pages/ar_viewer_page.dart';
import '../features/ar/presentation/pages/ar_list_page.dart';
import '../features/quiz/presentation/pages/quiz_setup_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';
import '../features/settings/presentation/pages/about_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) => '/splash',
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/videos',
      builder: (context, state) => const VideoListPage(),
    ),
    GoRoute(
      path: '/videos/:id',
      builder: (context, state) {
        final videoId = state.pathParameters['id'] ?? '1';
        return VideoDetailPage(videoId: videoId);
      },
    ),
    GoRoute(
      path: '/quiz-setup',
      builder: (context, state) => const QuizSetupPage(),
    ),
    GoRoute(
      path: '/quiz/:category/:difficulty',
      builder: (context, state) {
        final category = state.pathParameters['category'] ?? 'Bahasa';
        final difficulty = state.pathParameters['difficulty'] ?? 'Sedang';
        return QuizPage(category: category, difficulty: difficulty);
      },
    ),
    GoRoute(
      path: '/quiz-result',
      builder: (context, state) {
        final scoreString = state.uri.queryParameters['score'] ?? '0';
        final score = int.tryParse(scoreString) ?? 0;
        return QuizResultPage(score: score);
      },
    ),
    GoRoute(
      path: '/ar-list',
      builder: (context, state) => const ArListPage(),
    ),
    GoRoute(
      path: '/ar-viewer',
      builder: (context, state) {
        final modelPath = state.uri.queryParameters['model'] ?? 'assets/models/animal.glb';
        return ArViewerPage(modelPath: modelPath);
      },
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutPage(),
    ),
  ],
);
