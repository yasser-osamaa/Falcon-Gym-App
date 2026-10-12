import 'package:falcon_gym/core/utils/functions/filter_available_slots.dart';
import 'package:falcon_gym/core/utils/functions/generate_time_slot.dart';
import 'package:falcon_gym/core/utils/functions/is_expired_slot.dart';
import 'package:falcon_gym/core/utils/functions/snackbars_type.dart';
import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/core/widgets/shimmer/booking_time_section_shimmer.dart';
import 'package:falcon_gym/features/bookings_history/domain/entities/booking_entity.dart';
import 'package:falcon_gym/features/bookings_history/presentation/manager/booked_slots_cubit/booked_slots_cubit.dart';
import 'package:falcon_gym/features/home/domain/entities/sport_entity.dart';
import 'package:falcon_gym/features/home/presentation/views/book_detailes_widget/time_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingTimeSection extends StatefulWidget {
  const BookingTimeSection({
    required this.onTimeSelected,
    super.key,
    required this.opensAt,
    required this.closesAt,
    required this.duration,
    required this.selectedDate,
    required this.sportEntity,
  });

  final ValueChanged<TimeOfDay> onTimeSelected;
  final TimeOfDay opensAt;
  final TimeOfDay closesAt;
  final int duration;
  final DateTime selectedDate;
  final SportEntity sportEntity;

  @override
  State<BookingTimeSection> createState() => _BookingTimeSectionState();
}

class _BookingTimeSectionState extends State<BookingTimeSection> {
  late List<TimeOfDay> times;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    loadBookedSlots();
    times = generateTimeSlots(
      opensAt: widget.opensAt,
      closesAt: widget.closesAt,
      duration: widget.duration,
    );
  }

  void loadBookedSlots() {
    context.read<BookedSlotsCubit>().getBookedSlots(
      sportId: widget.sportEntity.id,
      bookingDate:
          '${widget.selectedDate.year}-'
          '${widget.selectedDate.month.toString().padLeft(2, '0')}-'
          '${widget.selectedDate.day.toString().padLeft(2, '0')}',
    );
  }

  @override
  void didUpdateWidget(covariant BookingTimeSection oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.opensAt != widget.opensAt ||
        oldWidget.closesAt != widget.closesAt ||
        oldWidget.duration != widget.duration ||
        oldWidget.selectedDate != widget.selectedDate ||
        oldWidget.sportEntity.id != widget.sportEntity.id) {
      times = generateTimeSlots(
        opensAt: widget.opensAt,
        closesAt: widget.closesAt,
        duration: widget.duration,
      );
      if (oldWidget.selectedDate != widget.selectedDate ||
          oldWidget.sportEntity.id != widget.sportEntity.id) {
        _selectedTime = null;
        loadBookedSlots();
      }
      _selectedTime = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isToday = isSameDay(widget.selectedDate, now);

    return BlocConsumer<BookedSlotsCubit, BookedSlotsState>(
      listener: (context, state) {
        if (state is BookedSlotsFailure) {
          showErrorSnackBar(context, state.errText);
        }
      },
      builder: (context, state) {
        if (state is BookedSlotsInitial || state is BookedSlotsLoading) {
          return const BookingTimeSectionShimmer();
        }

        final bookings = state is BookedSlotsSuccess
            ? state.bookedList
            : <BookingEntity>[];

        final availableTimes = filterAvailableSlots(
          times: times,
          bookings: bookings,
          selectedDate: widget.selectedDate,
          duration: widget.duration,
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available Times',
                  style: Styless.textStyle15.copyWith(
                    color: const Color(0xff202e35),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${widget.duration} min slots',
                  style: Styless.textStyle12.copyWith(
                    color: const Color(0xff899398),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            LayoutBuilder(
              builder: (context, constraints) => Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final time in times)
                    SizedBox(
                      width: (constraints.maxWidth - 16) / 3,
                      child: TimeOption(
                        time: time.format(context),
                        available:
                            availableTimes.contains(time) &&
                            !isExpiredSlot(
                              time,
                              now,
                              isToday,
                              widget.selectedDate,
                              widget.duration,
                            ),
                        selected: _selectedTime == time,
                        onTap:
                            availableTimes.contains(time) &&
                                !isExpiredSlot(
                                  time,
                                  now,
                                  isToday,
                                  widget.selectedDate,
                                  widget.duration,
                                )
                            ? () {
                                setState(() => _selectedTime = time);

                                widget.onTimeSelected(time);
                              }
                            : null,
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
