import 'package:cached_network_image/cached_network_image.dart';
import 'package:falcon_gym/features/home/domain/entities/sport_entity.dart';
import 'package:falcon_gym/features/home/presentation/views/activites_widgets/custom_back_button.dart';
import 'package:falcon_gym/features/home/presentation/views/book_detailes_widget/texts_header_column.dart';
import 'package:flutter/material.dart';

class BookingHeader extends StatelessWidget {
  const BookingHeader({super.key, required this.sportEntity});
  final SportEntity sportEntity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .30,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(imageUrl: sportEntity.imageUrl, fit: BoxFit.cover),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black38, Colors.transparent, Colors.black87],
                stops: [0, .42, 1],
              ),
            ),
          ),
          Positioned(
            top: 18,
            left: 18,
            child: SafeArea(child: const CustomBackButton()),
          ),
          Positioned(
            left: 28,
            right: 24,
            bottom: 24,
            child: TextsHeaderColumn(sportEntity: sportEntity),
          ),
        ],
      ),
    );
  }
}
