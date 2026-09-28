import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/icon_card.dart';
import 'package:flutter/material.dart';

class ActionContainerCard extends StatelessWidget {
  const ActionContainerCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.color,
    required this.icon,
  });
  final String title;
  final String subTitle;
  final Color color;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.sizeOf(context).width * .45,
      height: MediaQuery.sizeOf(context).height * .23,
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
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconCard(icon: icon, iconSize: 26, cardColor: Colors.white),
            SizedBox(height: 18),
            Text(
              title,
              style: Styless.textStyle15,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5),
            Text(
              subTitle,
              style: Styless.textStyle12.copyWith(color: Color(0xff707B80)),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 18),
            Align(
              alignment: AlignmentGeometry.bottomRight,
              child: IconCard(
                icon: Icons.arrow_forward_ios,
                width: 26,
                height: 26,
                raduis: 50,
                iconSize: 16,
                cardColor: Colors.white,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
