import 'package:falcon_gym/constants.dart';
import 'package:falcon_gym/features/bookings_history/data/models/booking_model.dart';
import 'package:falcon_gym/features/bookings_history/domain/entities/booking_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BookingRemoteDataSource {
  Future<List<BookingEntity>> getBookings({required String userId});

  Future<void> postBookings({
    required String userId,
    required int sportId,
    required String bookingDate,
    required String startTime,
    required String endTime,
  });

  Future<List<BookingEntity>> getBookedSlots({
    required int sportId,
    required String bookingDate,
  });

  Future<void> cancelBookings({required String bookingId});
}

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final supa = Supabase.instance.client;
  @override
  Future<List<BookingEntity>> getBookedSlots({
    required int sportId,
    required String bookingDate,
  }) async {
    List<BookingEntity> bookings = [];
    final data = await supa
        .from(kSupaBookings)
        .select()
        .eq('sport_id', sportId)
        .eq('booking_date', bookingDate);

    for (var element in data) {
      bookings.add(BookingModel.fromJson(element));
    }
    return bookings;
  }

  @override
  Future<List<BookingEntity>> getBookings({required String userId}) async {
    List<BookingEntity> bookings = [];
    final data = await supa
        .from(kSupaBookings)
        .select()
        .eq('user_id', userId)
        .order('booking_date', ascending: false)
        .order('start_time', ascending: false);

    for (var element in data) {
      bookings.add(BookingModel.fromJson(element));
    }
    return bookings;
  }

  @override
  Future<void> postBookings({
    required String userId,
    required int sportId,
    required String bookingDate,
    required String startTime,
    required String endTime,
  }) async {
    Map<String, dynamic> booking = {
      'user_id': userId,
      'sport_id': sportId,
      'booking_date': bookingDate,
      'start_time': startTime,
      'end_time': endTime,
    };
    await supa.from(kSupaBookings).insert(booking);
  }

  @override
  Future<void> cancelBookings({required String bookingId}) async {
    await supa.from(kSupaBookings).delete().eq('id', bookingId);
  }
}
