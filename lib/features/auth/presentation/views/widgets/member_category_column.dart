import 'package:falcon_gym/features/auth/presentation/views/widgets/membership_category_tile.dart';
import 'package:flutter/material.dart';

class MemberCategoryColumn extends StatelessWidget {
  const MemberCategoryColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MembershipCategoryTile(
          title: 'Civilian',
          subtitle: 'Flexible access for all guests',
          price: 'EGP 750',
          icon: Icons.person_outline,
          selected: true,
        ),
        const SizedBox(height: 8),
        const MembershipCategoryTile(
          title: 'Armed Forces',
          subtitle: 'Exclusive member rate',
          price: 'EGP 550',
          icon: Icons.military_tech_outlined,
        ),
        const SizedBox(height: 8),
        const MembershipCategoryTile(
          title: 'Dar Member',
          subtitle: 'Preferred Dar member rate',
          price: 'EGP 450',
          icon: Icons.home_outlined,
        ),
      ],
    );
  }
}
