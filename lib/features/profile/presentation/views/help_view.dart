import 'package:falcon_gym/features/home/presentation/views/activites_widgets/custom_back_button.dart';
import 'package:falcon_gym/features/profile/presentation/views/widgets/help_view_body.dart';
import 'package:flutter/material.dart';

class HelpView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CustomBackButton(),
          ),
        ),
        centerTitle: true,
        title: Text('Help & Support'),
      ),
      body: HelpViewBody(),
    );
  }
}
