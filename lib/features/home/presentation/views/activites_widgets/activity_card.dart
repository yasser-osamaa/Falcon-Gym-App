import 'package:falcon_gym/features/home/domain/entities/sport_entity.dart';
import 'package:falcon_gym/features/home/presentation/views/activites_widgets/activity_name_with_price_column.dart';
import 'package:falcon_gym/features/home/presentation/views/activites_widgets/container_text_with_border_side.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/icon_card.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    super.key,
    required this.color,
    required this.sportEntity,
    this.onTap,
  });
  final Color color;
  final SportEntity sportEntity;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
              icon: getSportIcon(sportEntity.name),
              iconSize: 30,
              cardColor: Color(int.parse('ff${sportEntity.color}', radix: 16)),
            ),
            SizedBox(width: 15),
            ActivityNameWithPriceColumn(sportEntity: sportEntity),
            Spacer(),
            ContainerTextWithBorderSide(),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}

IconData getSportIcon(String name) {
  switch (name.toLowerCase()) {
    case 'padel':
      return Icons.sports_tennis;
    case 'ping pong':
      return Icons.sports_tennis;
    case 'billiards':
      return Icons.sports_hockey;
    case 'snooker':
      return Icons.sports_golf;
    case 'squash':
      return Icons.sports_tennis;
    default:
      return Icons.sports;
  }
}
