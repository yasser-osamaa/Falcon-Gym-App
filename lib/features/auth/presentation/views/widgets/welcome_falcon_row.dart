import 'package:falcon_gym/constants.dart';
import 'package:falcon_gym/features/auth/presentation/views/widgets/welcome_falcon_texts_column.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/falcon_gym_circule.dart';
import 'package:flutter/material.dart';

class WelcomeFalconRow extends StatelessWidget {
  const WelcomeFalconRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: const FalconGymCircule(),
        ),
        const SizedBox(width: 14),
        Expanded(child: WelcomeFalconTextsColumn()),
      ],
    );
  }
}
