import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class TimeOption extends StatelessWidget {
  const TimeOption({
    super.key,
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
