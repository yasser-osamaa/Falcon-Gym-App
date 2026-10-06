import 'package:falcon_gym/core/widgets/navigation_bar_widgets/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(34),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavItem(
              icon: FontAwesomeIcons.house,
              label: 'Home',
              selected: navigationShell.currentIndex == 0,
              onTap: () => navigationShell.goBranch(0),
            ),
            NavItem(
              icon: FontAwesomeIcons.check,
              label: 'Bookings',
              selected: navigationShell.currentIndex == 1,
              onTap: () => navigationShell.goBranch(1),
            ),
            NavItem(
              icon: FontAwesomeIcons.dumbbell,
              label: 'Gym',
              selected: navigationShell.currentIndex == 2,
              onTap: () => navigationShell.goBranch(2),
            ),
            NavItem(
              icon: FontAwesomeIcons.user,
              label: 'Profile',
              selected: navigationShell.currentIndex == 3,
              onTap: () => navigationShell.goBranch(3),
            ),
          ],
        ),
      ),
    );
  }
}
