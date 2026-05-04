import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../bloc/auth_bloc.dart';
import 'refresh_listenable.dart';

GoRouter createRouter(AuthBloc authBloc) {
  return GoRouter(
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
        builder: (context, state, child) => Scaffold(body: child),
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            redirect: (_, __) => '/byAuthor',
          ),
          GoRoute(
            path: '/byAuthor',
            name: 'byAuthor',
            builder: (context, state) => const Placeholder(),
            routes: [
              GoRoute(
                path: 'detail',
                name: 'byAuthorDetail',
                builder: (context, state) => const Placeholder(),
              ),
            ],
          ),
          GoRoute(
            path: '/byTitle',
            name: 'byTitle',
            builder: (context, state) => const Placeholder(),
            routes: [
              GoRoute(
                path: 'detail',
                name: 'byTitleDetail',
                builder: (context, state) => const Placeholder(),
              ),
            ],
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => const Placeholder(),
          ),
        ],
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const Placeholder(),
      ),
    ],
  );
}
