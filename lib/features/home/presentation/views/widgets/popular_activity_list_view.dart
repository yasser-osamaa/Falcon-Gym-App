import 'package:falcon_gym/features/home/presentation/views/widgets/popular_activity_card.dart';
import 'package:flutter/material.dart';

class PopularActivityListView extends StatelessWidget {
  const PopularActivityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * .35,
            child: PopularActivitesCard(
              title: 'Padel',
              subTitle: 'From EGP 300',
              color: Color(0xffE4E9E9),
            ),
          ),
        );
      },
    );
  }
}
