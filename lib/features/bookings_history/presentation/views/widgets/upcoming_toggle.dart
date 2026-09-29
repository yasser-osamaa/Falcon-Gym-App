import 'package:falcon_gym/features/bookings_history/presentation/views/widgets/toggle_button.dart';
import 'package:flutter/material.dart';

class UpcomingToggle extends StatelessWidget {
  const UpcomingToggle({
    super.key,
    required this.isUpcoming,
    required this.onChanged,
  });

  final bool isUpcoming;
  final ValueChanged<bool> onChanged;

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
            onTap: () => onChanged(true),
          ),

          ToggleButton(
            title: 'Past',
            isSelected: !isUpcoming,
            onTap: () => onChanged(false),
          ),
        ],
      ),
    );
  }
}
