import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/home/presentation/views/activites_widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

class BookingHeader extends StatelessWidget {
  const BookingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .30,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/padel.jpg', fit: BoxFit.cover),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'COURT SPORT',
                  style: Styless.textStyle12.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Padel',
                  style: Styless.textStyle30.copyWith(
                    fontSize: 30,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'EGP 300 / hour',
                  style: Styless.textStyle12.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
