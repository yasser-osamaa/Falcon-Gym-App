import 'dart:async';

import 'package:falcon_gym/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TypingSignature extends StatefulWidget {
  const TypingSignature({super.key});

  @override
  State<TypingSignature> createState() => _TypingSignatureState();
}

class _TypingSignatureState extends State<TypingSignature> {
  final String _name = 'Falcon Gym';
  int _visibleLetters = 0;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() => _visibleLetters++);
      if (_visibleLetters == _name.length) timer.cancel();
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      context.go(AppRouter.kHomeView);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _name.substring(0, _visibleLetters),
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'AlexBrush',
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
