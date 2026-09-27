import 'package:falcon_gym/core/utils/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FalconGym());
}

class FalconGym extends StatelessWidget {
  const FalconGym({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Falcon Gym',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      routerConfig: AppRouter.router,
    );
  }
}
