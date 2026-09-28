import 'package:falcon_gym/features/home/presentation/views/widgets/small_icon_with_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DateRaw extends StatelessWidget {
  const DateRaw({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SmallIconWithText(
          text: 'Sat, 26 Apr',
          icon: FaIcon(
            FontAwesomeIcons.calendarCheck,
            size: 16,
            color: Color(0xff657178),
          ),
        ),
        SizedBox(width: 20),
        SmallIconWithText(
          text: '1 Hour',
          icon: FaIcon(
            FontAwesomeIcons.clock,
            size: 16,
            color: Color(0xff657178),
          ),
        ),
      ],
    );
  }
}
