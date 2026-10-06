import 'package:cached_network_image/cached_network_image.dart';
import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/gym/domain/entities/gym_exercises_entity.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ExercieseCard extends StatelessWidget {
  const ExercieseCard({super.key, required this.exercise});

  final GymExercisesEntity exercise;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 14, bottom: 14, right: 20, left: 20),
      decoration: BoxDecoration(
        color: const Color(0xffE7EBEC),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 12,
            color: Colors.black.withValues(alpha: .12),
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * .25,
              child: CachedNetworkImage(
                imageUrl: exercise.imageUrl,
                fit: BoxFit.fill,
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * .25,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.fitness_center, size: 40)),
              ),
            ),
          ),

          const SizedBox(height: 12),

          Text(
            exercise.name,
            style: Styless.textStyle19.copyWith(fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 8),

          Text(
            exercise.description,
            style: Styless.textStyle16.copyWith(fontWeight: FontWeight.w500),
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Text('${exercise.sets} Sets', style: Styless.textStyle15),
              const SizedBox(width: 16),
              Text(
                '${exercise.reps} Reps',
                style: Styless.textStyle15.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
