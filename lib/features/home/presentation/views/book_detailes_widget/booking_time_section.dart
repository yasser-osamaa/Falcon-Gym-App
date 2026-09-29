import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class BookingTimeSection extends StatefulWidget {
  const BookingTimeSection({required this.onTimeSelected, super.key});

  final ValueChanged<String> onTimeSelected;

  @override
  State<BookingTimeSection> createState() => _BookingTimeSectionState();
}

class _BookingTimeSectionState extends State<BookingTimeSection> {
  String _selectedTime = '7:00 PM';

  static const _times = [
    ('5:00 PM', true),
    ('6:00 PM', false),
    ('7:00 PM', true),
    ('8:00 PM', true),
    ('9:00 PM', false),
  ];

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
              '1 hour slots',
              style: Styless.textStyle12.copyWith(
                color: const Color(0xff899398),
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
              for (final time in _times)
                SizedBox(
                  width: (constraints.maxWidth - 16) / 3,
                  child: _TimeOption(
                    time: time.$1,
                    available: time.$2,
                    selected: _selectedTime == time.$1,
                    onTap: time.$2
                        ? () {
                            setState(() => _selectedTime = time.$1);
                            widget.onTimeSelected(time.$1);
                          }
                        : null,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TimeOption extends StatelessWidget {
  const _TimeOption({
    required this.time,
    required this.available,
    required this.selected,
    required this.onTap,
  });

  final String time;
  final bool available;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = selected
        ? const Color(0xff202e35)
        : available
        ? Colors.white
        : const Color(0xffeef0f0);

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(11),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(11),
        child: Container(
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            border: Border.all(
              color: selected
                  ? const Color(0xff202e35)
                  : const Color(0xffe2e6e7),
            ),
          ),
          child: Text(
            time,
            style: Styless.textStyle12.copyWith(
              color: selected
                  ? Colors.white
                  : available
                  ? const Color(0xff202e35)
                  : const Color(0xffb8c0c3),
              fontWeight: FontWeight.w700,
              decoration: available ? null : TextDecoration.lineThrough,
            ),
          ),
        ),
      ),
    );
  }
}
