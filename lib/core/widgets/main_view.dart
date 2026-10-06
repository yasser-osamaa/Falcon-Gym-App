import 'package:falcon_gym/core/widgets/navigation_bar_widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainView extends StatelessWidget {
  const MainView({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          navigationShell,
          Positioned(
            left: 20,
            right: 20,
            bottom: 10,
            child: CustomNavigationBar(navigationShell: navigationShell),
          ),
        ],
      ),
    );
  }
}
