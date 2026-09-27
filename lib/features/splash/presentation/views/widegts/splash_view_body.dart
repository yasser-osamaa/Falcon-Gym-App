import 'package:falcon_gym/features/splash/presentation/views/widegts/circule_with_latter.dart';
import 'package:falcon_gym/features/splash/presentation/views/widegts/circule_with_opacity.dart';
import 'package:falcon_gym/features/splash/presentation/views/widegts/splash_progress_line.dart';
import 'package:falcon_gym/features/splash/presentation/views/widegts/typing_signture.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(top: -130, right: -100, child: CirculeWithOpacity()),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CirculeWithLatter(),
              const SizedBox(height: 12),
              const SizedBox(height: 60, child: TypingSignature()),
              const SizedBox(height: 8),
              const Text(
                'S P O R T S  &  W E L L N E S S',
                style: TextStyle(
                  color: Color(0xffc5cbd0),
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 32),
              const SplashProgressLine(),
            ],
          ),
        ),
      ],
    );
  }
}
