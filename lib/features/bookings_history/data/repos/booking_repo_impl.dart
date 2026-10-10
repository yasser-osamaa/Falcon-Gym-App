import 'package:dartz/dartz.dart';
import 'package:falcon_gym/core/errors/failure.dart';
import 'package:falcon_gym/core/errors/supabase_failure.dart';
import 'package:falcon_gym/features/bookings_history/data/data_source/booking_remote_data_source.dart';
import 'package:falcon_gym/features/bookings_history/domain/entities/booking_entity.dart';
import 'package:falcon_gym/features/bookings_history/domain/repos/booking_repo.dart';

class BookingRepoImpl implements BookingRepo {
  final BookingRemoteDataSource bookingRemoteDataSource;

  BookingRepoImpl({required this.bookingRemoteDataSource});
  @override
  Future<Either<Failure, void>> cancelBookings({
    required String bookingId,
  }) async {
    try {
      return right(
        await bookingRemoteDataSource.cancelBookings(bookingId: bookingId),
      );
    } catch (e) {
      return left(SupabaseFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<BookingEntity>>> getBookedSlots({
    required int sportId,
    required String bookingDate,
  }) async {
    try {
      return right(
        await bookingRemoteDataSource.getBookedSlots(
          sportId: sportId,
          bookingDate: bookingDate,
        ),
      );
    } catch (e) {
      return left(SupabaseFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<BookingEntity>>> getBookings({
    required String userId,
  }) async {
    try {
      return right(await bookingRemoteDataSource.getBookings(userId: userId));
    } catch (e) {
      return left(SupabaseFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> postBookings({
    required String userId,
    required int sportId,
    required String bookingDate,
    required String startTime,
    required String endTime,
  }) async {
    try {
      return right(
        await bookingRemoteDataSource.postBookings(
          userId: userId,
          sportId: sportId,
          bookingDate: bookingDate,
          startTime: startTime,
          endTime: endTime,
        ),
      );
    } catch (e) {
      return left(SupabaseFailure.fromException(e));
    }
  }
}
