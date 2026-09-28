import 'package:falcon_gym/features/home/presentation/views/activites_widgets/activity_card.dart';
import 'package:flutter/material.dart';

class ActivityCardSliverList extends StatelessWidget {
  const ActivityCardSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: ActivityCard(color: Colors.white),
        );
      }, childCount: 8),
    );
  }
}
