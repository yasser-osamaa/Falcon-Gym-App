import 'package:falcon_gym/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:falcon_gym/features/profile/presentation/views/widgets/custome_button_with_icon.dart';
import 'package:falcon_gym/features/profile/presentation/views/widgets/member_data_section.dart';
import 'package:falcon_gym/features/profile/presentation/views/widgets/menu_items_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return CustomButtonWithIcon(
                    isLoading: state is AuthLoading,
                    onTap: () async {
                      await context.read<AuthCubit>().signout();

                      if (!context.mounted) return;
                      context.go('/');
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
