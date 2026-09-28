import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/popular_activity_list_view.dart';
import 'package:flutter/material.dart';

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
          child: PopularActivityListView(),
        ),
      ],
    );
  }
}
