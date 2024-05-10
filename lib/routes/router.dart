// watch for file changes which will rebuild the generated files:
// flutter packages pub run build_runner watch

// only generate files once and exit after use:
// flutter packages pub run build_runner build

import 'package:auto_route/auto_route.dart';
import 'package:calme/features/pages.dart';

// watch for file changes which will rebuild the generated files:
// dart run build_runner watch

// only generate files once and exit after use:
// dart run build_runner build

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    CustomRoute(
        page: SplashPage,
        path: '/splash',
        initial: true,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: LandingPage,
        path: '/landing',
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: LoginPage,
        path: '/login',
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: RegisterPage,
        path: '/register',
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: DashboardPage,
        path: '/dashboard',
        transitionsBuilder: TransitionsBuilders.fadeIn,
        children: [
          CustomRoute(
              path: 'home',
              page: HomePage,
              transitionsBuilder: TransitionsBuilders.fadeIn),
          CustomRoute(
              path: 'meditation',
              page: MeditationPage,
              transitionsBuilder: TransitionsBuilders.fadeIn),
          CustomRoute(
              path: 'article',
              page: ArticlePage,
              transitionsBuilder: TransitionsBuilders.fadeIn),
          CustomRoute(
              path: 'journal',
              page: JournalPage,
              transitionsBuilder: TransitionsBuilders.fadeIn),
          CustomRoute(
              path: 'profile',
              page: ProfilePage,
              transitionsBuilder: TransitionsBuilders.fadeIn),
        ]),
    CustomRoute(
        path: '/detail-article',
        page: DetailArticlePage,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        path: '/chatbot',
        page: ChatbotPage,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        path: '/detail-journal',
        page: JournalDetailPage,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        path: '/detail-meditation',
        page: MeditationDetailPage,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        path: '/session',
        page: SessionPage,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        path: '/journal-start',
        page: JournalStartPage,
        transitionsBuilder: TransitionsBuilders.fadeIn),
  ],
)
class $AppRouter {}
