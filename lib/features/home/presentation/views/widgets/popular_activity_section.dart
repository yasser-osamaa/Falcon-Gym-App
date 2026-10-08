import 'package:falcon_gym/constants.dart';
import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/home/presentation/manager/sports_cubit/sports_cubit.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/popular_activity_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularActivitySection extends StatelessWidget {
  const PopularActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Popular Activities', style: Styless.textStyle16),
        SizedBox(height: 15),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .18,
          child: BlocBuilder<SportsCubit, SportsState>(
            builder: (context, state) {
              if (state is SportsSuccess) {
                return PopularActivityListView(sports: state.sports);
              } else if (state is SportsFailure) {
                return Center(child: Text(state.errorText));
              } else {
                return Center(
                  child: CircularProgressIndicator(color: kPrimaryColor),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
