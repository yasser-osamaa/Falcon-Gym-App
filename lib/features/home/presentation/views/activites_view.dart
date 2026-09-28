import 'package:falcon_gym/features/home/presentation/views/activites_widgets/activities_view_body.dart';
import 'package:falcon_gym/features/home/presentation/views/activites_widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

class ActivitesView extends StatelessWidget {
  const ActivitesView({super.key});

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
        title: Text('Book a Sport'),
      ),
      body: SafeArea(child: ActivitiesViewBody()),
    );
  }
}
