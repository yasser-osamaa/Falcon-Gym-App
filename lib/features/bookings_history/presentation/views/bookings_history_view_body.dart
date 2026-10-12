import 'package:falcon_gym/core/utils/functions/filter_bookings_function.dart';
import 'package:falcon_gym/core/utils/functions/snackbars_type.dart';
import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/bookings_history/presentation/manager/booking_cubit/booking_cubit.dart';
import 'package:falcon_gym/features/bookings_history/presentation/views/widgets/history_card.dart';
import 'package:falcon_gym/features/bookings_history/presentation/views/widgets/no_upcoming_bookings.dart';
import 'package:falcon_gym/features/bookings_history/presentation/views/widgets/upcoming_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingsHistoryViewBody extends StatefulWidget {
  const BookingsHistoryViewBody({super.key});

  @override
  State<BookingsHistoryViewBody> createState() =>
      _BookingsHistoryViewBodyState();
}

class _BookingsHistoryViewBodyState extends State<BookingsHistoryViewBody> {
  bool isUpcoming = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(child: Text('My Bookings', style: Styless.textStyle19)),
            const SizedBox(height: 20),
            UpcomingToggle(
              isUpcoming: isUpcoming,
              onChanged: (value) {
                setState(() => isUpcoming = value);
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocConsumer<BookingCubit, BookingState>(
                listener: (context, state) {
                  if (state is BookingFailure) {
                    showErrorSnackBar(context, state.errText);
                  }

                  if (state is BookingActionFailure) {
                    showErrorSnackBar(context, state.errText);
                  }
                },
                builder: (context, state) {
                  if (state is BookingLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is BookingSuccess) {
                    final bookings = filterBookings(
                      state.bookings,
                      upcoming: isUpcoming,
                    );

                    if (bookings.isEmpty) {
                      return Center(
                        child: NoUpcomingBookings(
                          title: isUpcoming ? 'Upcoming' : 'Past',
                        ),
                      );
                    }

                    return isUpcoming
                        ? ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: bookings.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: HistoryCard(
                                  bookingEntity: bookings[index],
                                  isPast: false,
                                ),
                              );
                            },
                          )
                        : ListView.builder(
                            itemCount: bookings.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: HistoryCard(
                                  bookingEntity: bookings[index],
                                  isPast: true,
                                ),
                              );
                            },
                          );
                  }

                  if (state is BookingFailure ||
                      state is BookingActionFailure) {
                    return const SizedBox.shrink();
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
