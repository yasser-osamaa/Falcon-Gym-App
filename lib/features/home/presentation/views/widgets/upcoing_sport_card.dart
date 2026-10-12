import 'package:falcon_gym/features/bookings_history/domain/entities/booking_entity.dart';
import 'package:falcon_gym/features/home/presentation/manager/sports_cubit/sports_cubit.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/booking_code_row.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/card_side_bar.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/confirmed_sport_row.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/date_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpComingSportCard extends StatelessWidget {
  const UpComingSportCard({super.key, required this.bookingEntity});

  final BookingEntity bookingEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SportsCubit, SportsState>(
      builder: (context, state) {
        final sport = state is SportsSuccess
            ? state.sports
                  .where((sport) => sport.id == bookingEntity.sportId)
                  .firstOrNull
            : null;

        return Container(
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
                        sportName: sport?.name ?? 'Unknown Sport',
                        bookingEntity: bookingEntity,
                        subText:
                            '${bookingEntity.bookingDate.toIso8601String().split('T').first} , ${bookingEntity.startTime.format(context)}',
                      ),
                      const SizedBox(height: 15),
                      DateRaw(bookingEntity: bookingEntity),
                      const SizedBox(height: 8),
                      Divider(
                        color: Colors.black.withValues(alpha: .1),
                        thickness: .9,
                      ),
                      const Expanded(child: SizedBox(height: 8)),
                      BookingCodeRow(bookingEntity: bookingEntity),
                      const Expanded(child: SizedBox(height: 8)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
