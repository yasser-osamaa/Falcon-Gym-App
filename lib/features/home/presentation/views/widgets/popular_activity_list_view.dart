import 'package:falcon_gym/core/utils/app_router.dart';
import 'package:falcon_gym/features/home/domain/entities/sport_entity.dart';
import 'package:falcon_gym/features/home/presentation/views/activites_widgets/activity_card.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/popular_activity_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PopularActivityListView extends StatelessWidget {
  const PopularActivityListView({super.key, required this.sports});
  final List<SportEntity> sports;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: sports.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * .35,
            child: PopularActivitesCard(
              title: sports[index].name,
              subTitle: 'From EGP ${sports[index].pricePerHour}',
              color: Color(int.parse('ff${sports[index].color}', radix: 16)),
              onTap: () {
                context.push(AppRouter.kBookDetailesView, extra: sports[index]);
              },
              iconData: getSportIcon(sports[index].name),
            ),
          ),
        );
      },
    );
  }
}
