import 'package:flutter/material.dart';

class AnimatedDie extends StatelessWidget {
  const AnimatedDie({
    super.key,
    required this.value,
    this.size = 150,
  });

  final int value;
  final double size;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 450),
      switchInCurve: Curves.easeOutBack,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (Widget child, Animation<double> animation) {
        final rotateAnimation = Tween<double>(
          begin: 0.75,
          end: 1,
        ).animate(animation);

        return RotationTransition(
          turns: rotateAnimation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      child: Image.asset(
        'assets/images/dice-$value.png',
        key: ValueKey<int>(value),
        width: size,
      ),
    );
  }
}
