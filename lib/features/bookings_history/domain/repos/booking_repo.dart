import 'package:dartz/dartz.dart';
import 'package:falcon_gym/core/errors/failure.dart';
import 'package:falcon_gym/features/bookings_history/domain/entities/booking_entity.dart';

abstract class BookingRepo {
  Future<Either<Failure, List<BookingEntity>>> getBookings({
    required String userId,
  });

  Future<Either<Failure, void>> postBookings({
    required String userId,
    required int sportId,
    required String bookingDate,
    required String startTime,
    required String endTime,
  });
}
