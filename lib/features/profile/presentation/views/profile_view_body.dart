import 'package:falcon_gym/features/profile/presentation/views/widgets/custome_button_with_icon.dart';
import 'package:falcon_gym/features/profile/presentation/views/widgets/member_data_section.dart';
import 'package:falcon_gym/features/profile/presentation/views/widgets/menu_items_section.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF8F9F9),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 26, 20, 28),
          child: Column(
            children: [
              MemberDataSection(),
              const SizedBox(height: 16),
              MenuItemsSections(),
              const SizedBox(height: 13),
              CustomButtonWithIcon(),
            ],
          ),
        ),
      ),
    );
  }
}
