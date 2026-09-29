import 'package:falcon_gym/features/bookings_history/presentation/views/widgets/toggle_button.dart';
import 'package:flutter/material.dart';

class UpcomingToggle extends StatefulWidget {
  const UpcomingToggle({super.key});

  @override
  State<UpcomingToggle> createState() => _UpcomingToggleState();
}

class _UpcomingToggleState extends State<UpcomingToggle> {
  bool isUpcoming = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ToggleButton(
            title: 'Upcoming',
            isSelected: isUpcoming,
            onTap: () {
              setState(() {
                isUpcoming = true;
              });
            },
          ),

          ToggleButton(
            title: 'Past',
            isSelected: !isUpcoming,
            onTap: () {
              setState(() {
                isUpcoming = false;
              });
            },
          ),
        ],
      ),
    );
  }
}
