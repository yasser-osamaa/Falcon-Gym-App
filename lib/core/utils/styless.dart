import 'package:flutter/material.dart';

abstract class Styless {
  static TextStyle textStyle12 = TextStyle(
    fontSize: 12,
    color: Colors.white.withValues(alpha: 0.8),
    fontWeight: FontWeight.w400,
  );

  static TextStyle textStyle15 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textStyle24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );

  static TextStyle textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: 'PlayfairDisplay',
    fontStyle: FontStyle.italic,
  );
}
