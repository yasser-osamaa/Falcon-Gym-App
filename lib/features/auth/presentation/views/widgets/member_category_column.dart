import 'package:falcon_gym/features/auth/presentation/views/widgets/membership_category_tile.dart';
import 'package:flutter/material.dart';

class MemberCategoryColumn extends StatefulWidget {
  const MemberCategoryColumn({super.key});

  @override
  State<MemberCategoryColumn> createState() => _MemberCategoryColumnState();
}

class _MemberCategoryColumnState extends State<MemberCategoryColumn> {
  String memberShip = 'Civilian';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              memberShip = 'Civilian';
            });
          },
          child: MembershipCategoryTile(
            title: 'Civilian',
            subtitle: 'Flexible access for all guests',
            price: 'EGP 400',
            icon: Icons.person_outline,
            selected: memberShip == 'Civilian' ? true : false,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              memberShip = 'Armed';
            });
          },
          child: MembershipCategoryTile(
            title: 'Armed Forces',
            subtitle: 'Exclusive member rate',
            price: 'EGP 250',
            icon: Icons.military_tech_outlined,
            selected: memberShip == 'Armed' ? true : false,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              memberShip = 'Dar';
            });
          },
          child: MembershipCategoryTile(
            title: 'Dar Member',
            subtitle: 'Preferred Dar member rate',
            price: 'EGP 200',
            icon: Icons.home_outlined,
            selected: memberShip == 'Dar' ? true : false,
          ),
        ),
      ],
    );
  }
}
