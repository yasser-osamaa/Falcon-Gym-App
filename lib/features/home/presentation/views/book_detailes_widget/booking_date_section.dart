import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class BookingDateSection extends StatefulWidget {
  const BookingDateSection({required this.onDateSelected, super.key});

  final ValueChanged<String> onDateSelected;

  @override
  State<BookingDateSection> createState() => _BookingDateSectionState();
}

class _BookingDateSectionState extends State<BookingDateSection> {
  static const _dates = [
    ('Today', ''),
    ('Sat', '26'),
    ('Sun', '27'),
    ('Mon', '28'),
    ('Tue', '29'),
  ];

  int _selectedIndex = 1;

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
                child: _DateOption(
                  day: _dates[index].$1,
                  date: _dates[index].$2,
                  selected: _selectedIndex == index,
                  onTap: () {
                    setState(() => _selectedIndex = index);
                    final selectedDate = _dates[index];
                    widget.onDateSelected(
                      selectedDate.$2.isEmpty
                          ? selectedDate.$1
                          : '${selectedDate.$1} ${selectedDate.$2}',
                    );
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

class _DateOption extends StatelessWidget {
  const _DateOption({
    required this.day,
    required this.date,
    required this.selected,
    required this.onTap,
  });

  final String day;
  final String date;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final foregroundColor = selected ? Colors.white : const Color(0xff202e35);

    return Material(
      color: selected ? const Color(0xff202e35) : Colors.white,
      borderRadius: BorderRadius.circular(11),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(11),
        child: Container(
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            border: Border.all(
              color: selected
                  ? const Color(0xff202e35)
                  : const Color(0xffe2e6e7),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                day,
                style: Styless.textStyle12.copyWith(
                  color: selected ? Colors.white70 : const Color(0xff778187),
                  fontSize: 9,
                ),
              ),
              if (date.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  date,
                  style: Styless.textStyle12.copyWith(
                    color: foregroundColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
