import 'package:falcon_gym/core/widgets/main_view.dart';
import 'package:falcon_gym/features/auth/presentation/views/auth_view.dart';
import 'package:falcon_gym/features/bookings_history/presentation/views/bookings_history_view_body.dart';
import 'package:falcon_gym/features/gym/presentation/view/gym_view_body.dart';
import 'package:falcon_gym/features/gym/presentation/view/widgets/leg_day_view_body.dart';
import 'package:falcon_gym/features/gym/presentation/view/widgets/pull_day_view_body.dart';
import 'package:falcon_gym/features/gym/presentation/view/widgets/push_day_view_body.dart';
import 'package:falcon_gym/features/home/domain/entities/sport_entity.dart';
import 'package:falcon_gym/features/home/presentation/views/activites_view.dart';
import 'package:falcon_gym/features/home/presentation/views/book_detailes_view.dart';
import 'package:falcon_gym/features/home/presentation/views/home_view.dart';
import 'package:falcon_gym/features/profile/presentation/views/help_view.dart';
import 'package:falcon_gym/features/profile/presentation/views/profile_view_body.dart';
import 'package:falcon_gym/features/profile/presentation/views/terms_view.dart';
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

  static const String kAuthView = '/AuthView';

  static const String kPushView = '/PushView';
  static const String kPullView = '/PullView';
  static const String kLegView = '/LegView';

  static const String kHelpView = '/HelpView';
  static const String kTermsView = '/TermsView';

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
            transitionDuration: const Duration(milliseconds: 400),
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
          final sport = state.extra as SportEntity;
          return CustomTransitionPage(
            child: BookDetailesView(sportEntity: sport),
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),

      GoRoute(
        path: kPushView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const PushDayViewBody(),
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),

      GoRoute(
        path: kPullView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const PullDayViewBody(),
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),

      GoRoute(
        path: kLegView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const LegDayViewBody(),
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),

      GoRoute(
        path: kAuthView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const AuthView(),
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),

      GoRoute(
        path: kHelpView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const HelpView(),
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),

      GoRoute(
        path: kTermsView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const TermsView(),
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
