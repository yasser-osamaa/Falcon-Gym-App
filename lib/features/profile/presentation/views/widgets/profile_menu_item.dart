import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.showDivider = true,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final bool showDivider;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 55,
            child: Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: const Color(0xffF0F3F3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, size: 23, color: const Color(0xff26343A)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: Styless.textStyle12.copyWith(
                      color: const Color(0xff172126),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: Color(0xff26343A),
                ),
              ],
            ),
          ),
          if (showDivider) const Divider(height: 1, color: Color(0xffEEF0F0)),
        ],
      ),
    );
  }
}
