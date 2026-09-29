import 'package:falcon_gym/features/bookings_history/presentation/views/bookings_history_view_body.dart';
import 'package:falcon_gym/features/home/presentation/views/activites_view.dart';
import 'package:falcon_gym/features/home/presentation/views/book_detailes_view.dart';
import 'package:falcon_gym/features/home/presentation/views/home_view.dart';
import 'package:falcon_gym/features/splash/presentation/views/splash_view.dart';
import 'package:falcon_gym/core/widgets/section_placeholder_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          return Scaffold(
            body: navigationShell,
            bottomNavigationBar: NavigationBar(
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: (index) {
                navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                );
              },
              indicatorColor: const Color(0xffF0EBE4),
              destinations: const [
                NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.house),
                  selectedIcon: FaIcon(FontAwesomeIcons.houseChimney),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.check),
                  selectedIcon: Icon(Icons.event_note),
                  label: 'Bookings',
                ),
                NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.dumbbell),
                  selectedIcon: Icon(Icons.fitness_center),
                  label: 'Gym',
                ),
                NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.user),
                  selectedIcon: FaIcon(FontAwesomeIcons.userCheck),
                  label: 'Profile',
                ),
              ],
            ),
          );
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
                builder: (context, state) => const SectionPlaceholderView(
                  title: 'Gym',
                  icon: Icons.fitness_center_outlined,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: kProfileView,
                builder: (context, state) => const SectionPlaceholderView(
                  title: 'Profile',
                  icon: Icons.person_outline,
                ),
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
