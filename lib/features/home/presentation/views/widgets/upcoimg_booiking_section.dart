import 'package:falcon_gym/core/utils/app_router.dart';
import 'package:falcon_gym/core/utils/functions/snackbars_type.dart';
import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/bookings_history/presentation/manager/cubit/booking_cubit.dart';
import 'package:falcon_gym/features/bookings_history/presentation/views/widgets/no_upcoming_bookings.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/upcoing_sport_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UpComingBookingSection extends StatelessWidget {
  const UpComingBookingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit, BookingState>(
      listener: (context, state) {
        if (state is BookingActionSuccess) {
          context.read<BookingCubit>().getBookings(
            userId: Supabase.instance.client.auth.currentUser!.id,
          );
        }
        if (state is BookingFailure) {
          showErrorSnackBar(context, state.errText);
        }
        if (state is BookingActionFailure) {
          showErrorSnackBar(context, state.errText);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Upcoming Booking', style: Styless.textStyle16),
                (state is BookingSuccess && state.bookings.isNotEmpty)
                    ? TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                        ),
                        onPressed: () {
                          context.go(AppRouter.kBookinsView);
                        },
                        child: Text(
                          'See All',
                          style: Styless.textStyle12.copyWith(
                            color: Color(0xff9A713E),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),

            SizedBox(height: 10),
            (state is BookingSuccess && state.bookings.isNotEmpty)
                ? UpComingSportCard()
                : NoUpcomingBookings(),
          ],
        );
      },
    );
  }
}
