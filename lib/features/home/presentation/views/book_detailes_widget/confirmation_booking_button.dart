import 'package:falcon_gym/constants.dart';
import 'package:falcon_gym/core/utils/app_router.dart';
import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/bookings_history/presentation/manager/cubit/booking_cubit.dart';
import 'package:falcon_gym/features/home/domain/entities/sport_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ConfirmationBookingButton extends StatelessWidget {
  const ConfirmationBookingButton({
    required this.sportEntity,
    required this.bookingDate,
    required this.selectedTime,
    super.key,
  });

  final SportEntity sportEntity;
  final DateTime bookingDate;
  final TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit, BookingState>(
      listener: (context, state) {
        if (state is BookingActionFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errText)));
        }

        if (state is BookingActionSuccess) {
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (dialogContext) => AlertDialog(
              icon: const Icon(
                Icons.check_circle,
                color: Color(0xff23835b),
                size: 48,
              ),
              title: const Text('Booking confirmed'),
              content: Text(
                '${sportEntity.name} is booked for ${bookingDate.month}/${bookingDate.day} at ${selectedTime!.format(context)}.',
                textAlign: TextAlign.center,
              ),
              actions: [
                Center(
                  child: FilledButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(
                        kPrimaryColor,
                      ),
                    ),
                    onPressed: () async {
                      Navigator.of(dialogContext).pop();
                      final userId =
                          Supabase.instance.client.auth.currentUser!.id;
                      await context.read<BookingCubit>().getBookings(
                        userId: userId,
                      );
                      if (context.mounted) {
                        context.go(AppRouter.kBookinsView);
                      }
                    },
                    icon: const Icon(Icons.calendar_month),
                    label: const Text('View bookings'),
                  ),
                ),
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is BookingActionLoading;
        return SizedBox(
          height: 46,
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xff202e35),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: selectedTime == null || isLoading
                ? null
                : () {
                    final start = selectedTime!;
                    final endDateTime = DateTime(
                      bookingDate.year,
                      bookingDate.month,
                      bookingDate.day,
                      start.hour,
                      start.minute,
                    ).add(Duration(minutes: sportEntity.duration));
                    final userId =
                        Supabase.instance.client.auth.currentUser!.id;

                    context.read<BookingCubit>().postBooking(
                      userId: userId,
                      sportId: sportEntity.id,
                      bookingDate: bookingDate
                          .toIso8601String()
                          .split('T')
                          .first,
                      startTime: _formatTime(start),
                      endTime: _formatTime(TimeOfDay.fromDateTime(endDateTime)),
                    );
                  },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isLoading ? 'Confirming...' : 'Confirm Booking',
                  style: Styless.textStyle12.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 12),
                if (isLoading)
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                else
                  const Icon(Icons.chevron_right, size: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatTime(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}
