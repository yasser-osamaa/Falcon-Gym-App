import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class MembershipCategoryTile extends StatelessWidget {
  const MembershipCategoryTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.icon,
    this.selected = false,
  });

  final String title;
  final String subtitle;
  final String price;
  final IconData icon;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 9),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected
                  ? const Color(0xFFC99553)
                  : const Color(0xFFE7EBE9),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF1F0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, size: 18, color: const Color(0xFF202E34)),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Styless.textStyle15.copyWith(
                        color: const Color(0xFF202E34),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: Styless.textStyle12.copyWith(
                        color: const Color(0xFF929DA1),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: Styless.textStyle12.copyWith(
                      color: const Color(0xFF202E34),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '/mo',
                    style: Styless.textStyle12.copyWith(
                      color: const Color(0xFF929DA1),
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (selected)
          Positioned(
            top: -5,
            right: -4,
            child: Container(
              width: 18,
              height: 18,
              decoration: const BoxDecoration(
                color: Color(0xFFC99553),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 12),
            ),
          ),
      ],
    );
  }
}
