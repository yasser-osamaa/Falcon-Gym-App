import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/icon_card.dart';
import 'package:flutter/material.dart';

class ConfirmedSportRow extends StatelessWidget {
  const ConfirmedSportRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconCard(
          cardColor: Color(0xffEDF0F0),
          icon: Icons.sports_soccer,
          iconSize: 20,
          width: 40,
          height: 40,
          raduis: 12,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Padel',
              style: Styless.textStyle15.copyWith(fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 3),
            Text(
              'Tomorrow, 7:00 PM',
              style: Styless.textStyle12.copyWith(color: Color(0xff7E888D)),
            ),
          ],
        ),
        Spacer(flex: 2),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 213, 234, 227),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text(
            'Confirmed',
            style: Styless.textStyle12.copyWith(
              color: Color(0xff417865),
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
