import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MainView extends StatelessWidget {
  const MainView({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
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
  }
}
