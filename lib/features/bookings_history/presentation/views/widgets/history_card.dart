import 'package:falcon_gym/core/utils/functions/is_expired_slot.dart';
import 'package:falcon_gym/core/utils/functions/snackbars_type.dart';
import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/bookings_history/domain/entities/booking_entity.dart';
import 'package:falcon_gym/features/bookings_history/presentation/manager/booking_cubit/booking_cubit.dart';
import 'package:falcon_gym/features/bookings_history/presentation/views/widgets/can_not_cancel_today.dart';
import 'package:falcon_gym/features/bookings_history/presentation/views/widgets/custom_text_button.dart';
import 'package:falcon_gym/features/bookings_history/presentation/views/widgets/date_container_row.dart';
import 'package:falcon_gym/features/home/presentation/manager/sports_cubit/sports_cubit.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/confirmed_sport_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.bookingEntity,
    required this.isPast,
  });

  final BookingEntity bookingEntity;
  final bool isPast;

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
          height: MediaQuery.sizeOf(context).height * (isPast ? .24 : .35),
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
          child: Padding(
            padding: const EdgeInsets.only(left: 17, top: 17, right: 17),
            child: Column(
              children: [
                ConfirmedSportRow(
                  subText: 'Indoor Court 02',
                  bookingEntity: bookingEntity,
                  sportName: sport?.name ?? 'Unknown Sport',
                  statusText: isPast ? 'Done' : 'Confirmed',
                ),
                const SizedBox(height: 15),
                Divider(
                  color: Colors.black.withValues(alpha: .1),
                  thickness: .9,
                ),
                const SizedBox(height: 10),
                DateContainerRow(bookingEntity: bookingEntity),
                const Expanded(child: SizedBox(height: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Booking code ${bookingEntity.id.substring(0, 8)}',
                      style: Styless.textStyle12.copyWith(
                        color: const Color(0xff657178),
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      sport == null ? '--' : '${sport.pricePerHour} EGP/hour',
                      style: Styless.textStyle15.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                if (!isPast) ...[
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 45,
                    child: BlocConsumer<BookingCubit, BookingState>(
                      listener: (context, state) {
                        if (state is BookingActionSuccess) {
                          context.read<BookingCubit>().getBookings(
                            userId: bookingEntity.userId,
                          );
                        }
                        if (state is BookingActionFailure) {
                          showErrorSnackBar(context, state.errText);
                        }
                      },
                      builder: (context, state) {
                        final now = DateTime.now();
                        final today = isSameDay(bookingEntity.bookingDate, now);
                        final isLoading = state is BookingActionLoading;
                        return today
                            ? CannotCancelTodayWidget()
                            : CustomTextButton(
                                text: isLoading ? 'Canceling...' : 'Cancel',
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        context
                                            .read<BookingCubit>()
                                            .cancelBooking(
                                              bookingId: bookingEntity.id,
                                            );
                                      },
                              );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
                SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
