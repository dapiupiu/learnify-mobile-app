import 'package:go_router/go_router.dart';
import '../features/home/presentation/pages/splash_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/video/presentation/pages/video_list_page.dart';
import '../features/video/presentation/pages/video_detail_page.dart';
import '../features/quiz/presentation/pages/quiz_page.dart';
import '../features/quiz/presentation/pages/quiz_result_page.dart';
import '../features/ar/presentation/pages/ar_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
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
      path: '/quiz',
      builder: (context, state) => const QuizPage(quizTitle: 'Kuis Umum'),
    ),
    GoRoute(
      path: '/quiz/:title',
      builder: (context, state) {
        final quizTitle = state.pathParameters['title'] ?? 'Kuis Umum';
        return QuizPage(quizTitle: quizTitle);
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
      path: '/ar',
      builder: (context, state) => const ARPage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
  ],
);
