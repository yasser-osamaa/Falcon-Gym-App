import 'package:falcon_gym/constants.dart';
import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/splash/presentation/views/widegts/circule_with_opacity.dart';
import 'package:flutter/material.dart';

class GymIntroCard extends StatelessWidget {
  const GymIntroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .2,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -60,
            right: -60,
            child: CirculeWithOpacity(height: 150, width: 150),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.fitness_center,
                  color: Color(0xFFD8C09C),
                  size: 22,
                ),
                const SizedBox(height: 12),
                Text(
                  'Move better. Feel stronger.',
                  style: Styless.textStyle19.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 6),
                Text(
                  'Explore guided workouts and build a training routine that works for you.',
                  style: Styless.textStyle12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
