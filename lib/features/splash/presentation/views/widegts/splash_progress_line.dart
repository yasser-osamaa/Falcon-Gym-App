import 'package:flutter/material.dart';

class SplashProgressLine extends StatefulWidget {
  const SplashProgressLine({super.key});

  @override
  State<SplashProgressLine> createState() => _SplashProgressLineState();
}

class _SplashProgressLineState extends State<SplashProgressLine>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 2,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Stack(
              children: [
                const Positioned.fill(child: ColoredBox(color: Colors.white12)),
                Align(
                  alignment: Alignment(_controller.value * 3 - 1, 0),
                  child: child,
                ),
              ],
            ),
          );
        },
        child: const SizedBox(
          width: 25,
          height: 2,
          child: ColoredBox(color: Color(0xffC19A64)),
        ),
      ),
    );
  }
}
