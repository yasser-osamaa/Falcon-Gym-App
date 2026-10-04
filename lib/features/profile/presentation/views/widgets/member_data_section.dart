import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/core/widgets/section_placeholder_view.dart';
import 'package:falcon_gym/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:falcon_gym/features/profile/presentation/views/widgets/active_member_container.dart';
import 'package:falcon_gym/features/profile/presentation/views/widgets/contacts_row.dart';
import 'package:falcon_gym/features/profile/presentation/views/widgets/name_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemberDataSection extends StatelessWidget {
  const MemberDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess && state.userEntity != null) {
          return Column(
            children: [
              NameCircleAvatar(name: state.userEntity!.name),
              const SizedBox(height: 14),
              Text(
                state.userEntity!.name,
                style: Styless.textStyle19.copyWith(
                  color: const Color(0xff11191D),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                '${state.userEntity!.type} Member',
                style: Styless.textStyle12.copyWith(
                  color: const Color(0xff7A8589),
                ),
              ),
              const SizedBox(height: 9),
              ActiveMemberContainer(),
              const SizedBox(height: 15),
              const Divider(color: Color(0xffEEF0F0), height: 1),
              const SizedBox(height: 13),
              ContactsRow(
                phone: state.userEntity!.phone ?? "No phone number",
                email: state.userEntity!.email,
              ),
              const SizedBox(height: 16),
              const Divider(color: Color(0xffEEF0F0), height: 1),
            ],
          );
        } else if (state is AuthLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SectionPlaceholderView(title: 'Profile', icon: Icons.person);
        }
      },
    );
  }
}
