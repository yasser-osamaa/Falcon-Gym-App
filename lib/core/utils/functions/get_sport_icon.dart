import 'package:flutter/material.dart';

IconData getSportIcon(String name) {
  switch (name.toLowerCase()) {
    case 'padel':
      return Icons.sports_tennis;
    case 'ping pong':
      return Icons.sports_tennis;
    case 'billiards':
      return Icons.sports_hockey;
    case 'snooker':
      return Icons.sports_golf;
    case 'squash':
      return Icons.sports_tennis;
    default:
      return Icons.sports;
  }
}
