// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:falcon_gym/core/utils/app_router.dart';
import 'package:falcon_gym/main.dart';

void main() {
  testWidgets('bottom navigation opens each section', (tester) async {
    AppRouter.router.go(AppRouter.kHomeView);
    await tester.pumpWidget(const FalconGym());
    await tester.pumpAndSettle();

    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.text('Upcoming Booking'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.event_note_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Bookings'), findsWidgets);

    await tester.tap(find.byIcon(Icons.fitness_center_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Gym'), findsWidgets);

    await tester.tap(find.byIcon(Icons.person_outline));
    await tester.pumpAndSettle();
    expect(find.text('Profile'), findsWidgets);

    await tester.tap(find.byIcon(Icons.home_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Upcoming Booking'), findsOneWidget);
  });
}
