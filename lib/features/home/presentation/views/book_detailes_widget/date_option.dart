import 'package:falcon_gym/features/home/presentation/views/book_detailes_widget/date_card.dart';
import 'package:flutter/material.dart';

class DateOption extends StatelessWidget {
  const DateOption({
    super.key,
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
        child: DateCard(
          selected: selected,
          day: day,
          date: date,
          foregroundColor: foregroundColor,
        ),
      ),
    );
  }
}
