import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/profile/presentation/views/widgets/active_member_container.dart';
import 'package:falcon_gym/features/profile/presentation/views/widgets/contacts_row.dart';
import 'package:falcon_gym/features/profile/presentation/views/widgets/name_circle_avatar.dart';
import 'package:flutter/material.dart';

class MemberDataSection extends StatelessWidget {
  const MemberDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NameCircleAvatar(),
        const SizedBox(height: 14),
        Text(
          'Yasser Osama',
          style: Styless.textStyle19.copyWith(color: const Color(0xff11191D)),
        ),
        const SizedBox(height: 3),
        Text(
          'Civilian Member',
          style: Styless.textStyle12.copyWith(color: const Color(0xff7A8589)),
        ),
        const SizedBox(height: 9),
        ActiveMemberContainer(),
        const SizedBox(height: 15),
        const Divider(color: Color(0xffEEF0F0), height: 1),
        const SizedBox(height: 13),
        ContactsRow(),
        const SizedBox(height: 16),
        const Divider(color: Color(0xffEEF0F0), height: 1),
      ],
    );
  }
}
