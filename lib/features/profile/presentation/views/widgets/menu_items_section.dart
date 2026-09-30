import 'package:falcon_gym/features/profile/presentation/views/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';

class MenuItemsSections extends StatelessWidget {
  const MenuItemsSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xffEEF0F0)),
      ),
      child: const Column(
        children: [
          ProfileMenuItem(
            icon: Icons.person_outline,
            title: 'Personal Information',
          ),
          ProfileMenuItem(
            icon: Icons.credit_card_outlined,
            title: 'My Membership',
          ),
          ProfileMenuItem(icon: Icons.help_outline, title: 'Help & Support'),
          ProfileMenuItem(
            icon: Icons.description_outlined,
            title: 'Terms & Conditions',
            showDivider: false,
          ),
        ],
      ),
    );
  }
}
