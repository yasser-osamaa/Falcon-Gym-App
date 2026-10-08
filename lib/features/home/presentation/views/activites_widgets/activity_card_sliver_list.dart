import 'package:falcon_gym/constants.dart';
import 'package:falcon_gym/features/home/presentation/manager/sports_cubit/sports_cubit.dart';
import 'package:falcon_gym/features/home/presentation/views/activites_widgets/activity_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityCardSliverList extends StatelessWidget {
  const ActivityCardSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SportsCubit, SportsState>(
      builder: (context, state) {
        if (state is SportsFailure) {
          return Center(child: Text(state.errorText));
        } else if (state is SportsSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ActivityCard(
                  color: Colors.white,
                  sportEntity: state.sports[index],
                ),
              );
            }, childCount: state.sports.length),
          );
        } else {
          return Center(child: CircularProgressIndicator(color: kPrimaryColor));
        }
      },
    );
  }
}
