import 'package:falcon_gym/core/utils/app_router.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/action_container_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookAndGymRawCards extends StatelessWidget {
  const BookAndGymRawCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ActionContainerCard(
            title: 'Book a Sport',
            subTitle: 'Reserve your favorite court or table',
            color: Color(0xffE7EBEC),
            icon: Icons.sports_soccer,
            onTap: () {
              context.push(AppRouter.kActivitesView);
            },
          ),
        ),
        Expanded(
          child: ActionContainerCard(
            title: 'Gym Membership',
            subTitle: 'View membership plans and prices',
            color: Color(0xffF0EBE4),
            icon: Icons.fitness_center,
            onTap: () {
              context.go(AppRouter.kGymView);
            },
          ),
        ),
      ],
    );
  }
}
