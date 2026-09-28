import 'package:falcon_gym/features/home/presentation/views/widgets/activites_widgets/activities_view_body.dart';
import 'package:flutter/material.dart';

class ActivitesView extends StatelessWidget {
  const ActivitesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Book a Sport'),
        actions: [],
      ),
      body: SafeArea(child: ActivitiesViewBody()),
    );
  }
}
