import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../bloc/auth_bloc.dart';
import '../data/books.dart';
import '../pages/book_detail_page.dart';
import '../pages/by_author_page.dart';
import '../pages/by_title_page.dart';
import '../pages/login_page.dart';
import '../pages/profile_page.dart';
import '../widgets/main_page.dart';
import 'refresh_listenable.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter(AuthBloc authBloc) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/byAuthor',
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    redirect: (context, state) {
      final isLoggedIn = authBloc.state is LoggedIn;
      final isLoginRoute = state.matchedLocation == '/login';

      if (isLoggedIn && isLoginRoute) return '/byAuthor';
      if (!isLoggedIn && !isLoginRoute) return '/login';
      return null;
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) =>
            MainPage(state: state, child: child),
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            redirect: (_, __) => '/byAuthor',
          ),
          GoRoute(
            path: '/byAuthor',
            name: 'byAuthor',
            builder: (context, state) => const ByAuthorPage(),
            routes: [
              GoRoute(
                path: 'detail',
                name: 'byAuthorDetail',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) =>
                    BookDetailPage(book: state.extra as Book),
              ),
            ],
          ),
          GoRoute(
            path: '/byTitle',
            name: 'byTitle',
            builder: (context, state) => const ByTitlePage(),
            routes: [
              GoRoute(
                path: 'detail',
                name: 'byTitleDetail',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) =>
                    BookDetailPage(book: state.extra as Book),
              ),
            ],
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );
}
