import 'dart:async';

import 'package:falcon_gym/core/utils/app_router.dart';
import 'package:falcon_gym/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

    Future.delayed(const Duration(seconds: 3), () async {
      if (!mounted) return;

      final session = Supabase.instance.client.auth.currentSession;
      if (session != null) {
        await context.read<AuthCubit>().getUser();

        if (!mounted) return;
        context.go(AppRouter.kHomeView);
      } else {
        context.go(AppRouter.kAuthView);
      }
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
