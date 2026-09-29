import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class ViewingBadge extends StatelessWidget {
  const ViewingBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xff202e35),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.grid_view_rounded,
            color: Color(0xffc6a56d),
            size: 18,
          ),
          const SizedBox(width: 7),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'VIEWING',
                style: Styless.textStyle12.copyWith(
                  color: Colors.white60,
                  fontSize: 7,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Book Padel',
                style: Styless.textStyle12.copyWith(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
