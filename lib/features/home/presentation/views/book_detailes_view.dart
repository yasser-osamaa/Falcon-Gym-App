import 'package:falcon_gym/features/home/domain/entities/sport_entity.dart';
import 'package:falcon_gym/features/home/presentation/views/book_detailes_widget/booking_detailes_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailesView extends StatelessWidget {
  const BookDetailesView({super.key, required this.sportEntity});
  final SportEntity sportEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BookDetailesViewBody(sportEntity: sportEntity));
  }
}
