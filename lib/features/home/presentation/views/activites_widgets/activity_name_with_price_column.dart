import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/home/domain/entities/sport_entity.dart';
import 'package:flutter/material.dart';

class ActivityNameWithPriceColumn extends StatelessWidget {
  const ActivityNameWithPriceColumn({super.key, required this.sportEntity});
  final SportEntity sportEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(sportEntity.name, style: Styless.textStyle15),
        SizedBox(height: 10),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'EGP ${sportEntity.pricePerHour}',
                style: TextStyle(
                  color: Color(0xff9A713E),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ' / hour',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
