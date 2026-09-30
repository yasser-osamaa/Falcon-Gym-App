import 'package:falcon_gym/core/widgets/main_view.dart';
import 'package:falcon_gym/features/bookings_history/presentation/views/bookings_history_view_body.dart';
import 'package:falcon_gym/features/gym/presentation/view/gym_view_body.dart';
import 'package:falcon_gym/features/home/presentation/views/activites_view.dart';
import 'package:falcon_gym/features/home/presentation/views/book_detailes_view.dart';
import 'package:falcon_gym/features/home/presentation/views/home_view.dart';
import 'package:falcon_gym/features/profile/presentation/views/profile_view_body.dart';
import 'package:falcon_gym/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kHomeView = '/HomeView';
  static const String kBookinsView = '/BookinsView';
  static const String kGymView = '/GymView';
  static const String kProfileView = '/ProfileView';

  static const String kActivitesView = '/ActivitesView';
  static const String kBookDetailesView = '/BookDetailesView';

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainView(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: kHomeView,
                builder: (context, state) => const HomeView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: kBookinsView,
                builder: (context, state) => const BookingsHistoryViewBody(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: kGymView,
                builder: (context, state) => GymViewBody(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: kProfileView,
                builder: (context, state) => ProfileViewBody(),
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        path: kActivitesView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const ActivitesView(),
            transitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),

      GoRoute(
        path: kBookDetailesView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const BookDetailesView(),
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
    ],
  );
}
