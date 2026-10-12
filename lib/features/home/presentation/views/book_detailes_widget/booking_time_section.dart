import 'package:falcon_gym/core/utils/functions/generate_time_slot.dart';
import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/home/presentation/views/book_detailes_widget/time_option.dart';
import 'package:flutter/material.dart';

class BookingTimeSection extends StatefulWidget {
  const BookingTimeSection({
    required this.onTimeSelected,
    super.key,
    required this.opensAt,
    required this.closesAt,
    required this.duration,
    required this.selectedDate,
  });

  final ValueChanged<TimeOfDay> onTimeSelected;
  final TimeOfDay opensAt;
  final TimeOfDay closesAt;
  final int duration;
  final DateTime selectedDate;

  @override
  State<BookingTimeSection> createState() => _BookingTimeSectionState();
}

class _BookingTimeSectionState extends State<BookingTimeSection> {
  late List<TimeOfDay> times;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();

    times = generateTimeSlots(
      opensAt: widget.opensAt,
      closesAt: widget.closesAt,
      duration: widget.duration,
    );
  }

  @override
  void didUpdateWidget(covariant BookingTimeSection oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.opensAt != widget.opensAt ||
        oldWidget.closesAt != widget.closesAt ||
        oldWidget.duration != widget.duration ||
        oldWidget.selectedDate != widget.selectedDate) {
      times = generateTimeSlots(
        opensAt: widget.opensAt,
        closesAt: widget.closesAt,
        duration: widget.duration,
      );

      _selectedTime = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isToday = _isSameDay(widget.selectedDate, now);

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
                    available: !_isExpiredSlot(time, now, isToday),
                    selected: _selectedTime == time,
                    onTap: _isExpiredSlot(time, now, isToday)
                        ? null
                        : () {
                            setState(() {
                              _selectedTime = time;
                            });

                            widget.onTimeSelected(time);
                          },
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  bool _isExpiredSlot(TimeOfDay time, DateTime now, bool isToday) {
    if (!isToday) {
      return false;
    }

    final slotEnd = DateTime(
      widget.selectedDate.year,
      widget.selectedDate.month,
      widget.selectedDate.day,
      time.hour,
      time.minute,
    ).add(Duration(minutes: widget.duration));

    return !slotEnd.isAfter(now);
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
