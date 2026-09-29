import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/confirmed_sport_row.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .3,
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 17, top: 17, right: 17),
          child: Column(
            children: [
              ConfirmedSportRow(subText: 'Indour Court 02'),
              SizedBox(height: 15),
              Divider(color: Colors.black.withValues(alpha: .1), thickness: .9),
              SizedBox(height: 15),

              SizedBox(height: 8),
              Expanded(child: SizedBox(height: 8)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Booking code FG-48291',
                    style: Styless.textStyle12.copyWith(
                      color: Color(0xff657178),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '300EGP',
                    style: Styless.textStyle15.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Expanded(child: SizedBox(height: 8)),
            ],
          ),
        ),
      ),
    );
  }
}
