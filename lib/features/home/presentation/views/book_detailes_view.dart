import 'package:falcon_gym/core/utils/service_locator.dart';
import 'package:falcon_gym/features/bookings_history/domain/repos/booking_repo.dart';
import 'package:falcon_gym/features/bookings_history/presentation/manager/booked_slots_cubit/booked_slots_cubit.dart';
import 'package:falcon_gym/features/home/domain/entities/sport_entity.dart';
import 'package:falcon_gym/features/home/presentation/views/book_detailes_widget/booking_detailes_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailesView extends StatelessWidget {
  const BookDetailesView({super.key, required this.sportEntity});
  final SportEntity sportEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BookedSlotsCubit(bookingRepo: getIt.get<BookingRepo>()),
      child: Scaffold(body: BookDetailesViewBody(sportEntity: sportEntity)),
    );
  }
}
