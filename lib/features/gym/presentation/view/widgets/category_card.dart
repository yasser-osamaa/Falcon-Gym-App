import 'package:falcon_gym/features/gym/presentation/view/widgets/category_texts_column.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/icon_card.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.icon,
    required this.label,
    required this.title,
    required this.detail,
    required this.iconColor,
    required this.iconBackground,
  });

  final IconData icon;
  final String label;
  final String title;
  final String detail;
  final Color iconColor;
  final Color iconBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE7E9E8)),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          IconCard(
            icon: icon,
            iconSize: 20,
            cardColor: iconBackground,
            raduis: 10,
            height: 40,
            width: 40,
            iconColor: iconColor,
            hasShadow: false,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: CategoryTextsColumn(
              label: label,
              title: title,
              detail: detail,
            ),
          ),
        ],
      ),
    );
  }
}
