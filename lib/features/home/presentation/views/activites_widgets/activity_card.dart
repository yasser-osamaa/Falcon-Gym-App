import 'package:falcon_gym/core/utils/app_router.dart';
import 'package:falcon_gym/features/home/presentation/views/activites_widgets/activity_name_with_price_column.dart';
import 'package:falcon_gym/features/home/presentation/views/activites_widgets/container_text_with_border_side.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/icon_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.kBookDetailesView);
      },
      child: Container(
        height: MediaQuery.sizeOf(context).height * .12,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 12,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: 20),
            IconCard(
              width: 65,
              height: 65,
              icon: Icons.sports_basketball,
              iconSize: 30,
              cardColor: Color(0xffE4E9E9),
            ),
            SizedBox(width: 15),
            ActivityNameWithPriceColumn(),
            Spacer(),
            ContainerTextWithBorderSide(),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
