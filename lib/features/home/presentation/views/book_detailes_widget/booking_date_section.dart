import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/home/presentation/views/book_detailes_widget/date_option.dart';
import 'package:flutter/material.dart';

class BookingDateSection extends StatefulWidget {
  const BookingDateSection({required this.onDateSelected, super.key});

  final ValueChanged<DateTime> onDateSelected;

  @override
  State<BookingDateSection> createState() => _BookingDateSectionState();
}

class _BookingDateSectionState extends State<BookingDateSection> {
  late final List<DateTime> _dates;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();

    final today = DateTime.now();
    _dates = List.generate(
      6,
      (index) => DateTime(today.year, today.month, today.day + index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose Date',
          style: Styless.textStyle15.copyWith(
            color: const Color(0xff202e35),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            for (var index = 0; index < _dates.length; index++) ...[
              if (index > 0) const SizedBox(width: 6),
              Expanded(
                child: DateOption(
                  day: index == 0
                      ? 'Today'
                      : _dayName(_dates[index]).substring(0, 3),
                  date: index == 0 ? '' : '${_dates[index].day}',
                  selected: _selectedIndex == index,
                  onTap: () {
                    setState(() => _selectedIndex = index);
                    final selectedDate = _dates[index];
                    widget.onDateSelected(selectedDate);
                  },
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}

String _dayName(DateTime date) {
  const days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  return days[date.weekday - 1];
}
