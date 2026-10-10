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
  });

  final ValueChanged<String> onTimeSelected;
  final TimeOfDay opensAt;
  final TimeOfDay closesAt;
  final int duration;
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
  Widget build(BuildContext context) {
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
                    available: true,
                    selected: _selectedTime == time,
                    onTap: () {
                      setState(() {
                        _selectedTime = time;
                      });

                      widget.onTimeSelected(time.format(context));
                    },
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
