import 'package:falcon_gym/features/bookings_history/domain/entities/booking_entity.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/booking_code_row.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/card_side_bar.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/confirmed_sport_row.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/date_row.dart';
import 'package:flutter/material.dart';

class UpComingSportCard extends StatelessWidget {
  const UpComingSportCard({super.key, required this.bookingEntity});
  final BookingEntity bookingEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.sizeOf(context).width * .45,
      height: MediaQuery.sizeOf(context).height * .19,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardSideBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 17, top: 17, right: 17),
              child: Column(
                children: [
                  ConfirmedSportRow(
                    subText:
                        '${bookingEntity.bookingDate} , ${bookingEntity.startTime}',
                  ),
                  SizedBox(height: 15),
                  DateRaw(bookingEntity: bookingEntity),
                  SizedBox(height: 8),
                  Divider(
                    color: Colors.black.withValues(alpha: .1),
                    thickness: .9,
                  ),
                  Expanded(child: SizedBox(height: 8)),
                  BookingCodeRow(bookingEntity: bookingEntity),
                  Expanded(child: SizedBox(height: 8)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
