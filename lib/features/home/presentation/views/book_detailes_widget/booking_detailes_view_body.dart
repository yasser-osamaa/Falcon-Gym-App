import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/core/widgets/shimmer/booking_time_section_shimmer.dart';
import 'package:falcon_gym/features/home/domain/entities/sport_entity.dart';
import 'package:falcon_gym/features/home/presentation/manager/sport_schedule_cubit/sport_schedule_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'booking_date_section.dart';
import 'booking_header.dart';
import 'booking_summary_footer.dart';
import 'booking_time_section.dart';

class BookDetailesViewBody extends StatefulWidget {
  const BookDetailesViewBody({super.key, required this.sportEntity});
  final SportEntity sportEntity;
  @override
  State<BookDetailesViewBody> createState() => _BookDetailesViewBodyState();
}

class _BookDetailesViewBodyState extends State<BookDetailesViewBody> {
  DateTime _selectedDate = DateTime.now();
  String? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xfff7f8f8),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: BookingHeader(sportEntity: widget.sportEntity),
                    ),

                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(28, 18, 28, 24),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Enjoy a private, well-maintained court with quality equipment and everything ready for your game.',
                              style: Styless.textStyle12.copyWith(
                                color: Color(0xff657178),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 26),

                            BookingDateSection(
                              onDateSelected: (date) {
                                setState(() {
                                  _selectedDate = date;
                                });
                              },
                            ),

                            const SizedBox(height: 28),

                            BlocBuilder<SportScheduleCubit, SportScheduleState>(
                              builder: (context, state) {
                                if (state is SportScheduleSuccess) {
                                  final selectedDay = _dayName(_selectedDate);
                                  final schedule = state.sportSchedule
                                      .firstWhere(
                                        (item) => item.day == selectedDay,
                                      );
                                  return BookingTimeSection(
                                    closesAt: schedule.closesAt,
                                    opensAt: schedule.opensAt,
                                    duration: widget.sportEntity.duration,
                                    onTimeSelected: (time) {
                                      setState(() {
                                        _selectedTime = time;
                                      });
                                    },
                                  );
                                }
                                return BookingTimeSectionShimmer();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              BookingSummaryFooter(
                dateLabel: _formatDate(_selectedDate),
                selectedTime: _selectedTime ?? 'Choose Time',
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return '${days[date.weekday - 1]} ${date.day}';
  }

  String _dayName(DateTime date) {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    return days[date.weekday - 1];
  }
}
