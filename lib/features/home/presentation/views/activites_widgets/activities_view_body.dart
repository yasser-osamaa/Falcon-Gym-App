import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/home/presentation/views/activites_widgets/activity_card_sliver_list.dart';
import 'package:flutter/material.dart';

class ActivitiesViewBody extends StatelessWidget {
  const ActivitiesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text('Choose an activity', style: Styless.textStyle24),
                const SizedBox(height: 15),
                Text(
                  'Select a sport to view available times.',
                  style: Styless.textStyle15.copyWith(
                    color: Colors.black.withValues(alpha: .4),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          ActivityCardSliverList(),
        ],
      ),
    );
  }
}
