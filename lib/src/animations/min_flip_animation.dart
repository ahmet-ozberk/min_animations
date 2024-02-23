import 'package:flutter/material.dart';
import 'package:min_animations/src/extension_animations/extension_animations.dart';

class MinFlipAnimation extends StatelessWidget {
  final Widget child;
  final void Function(AnimationController)? listener;
  final void Function()? onEnd;
  final Duration duration;
  final double begin;
  final double end;
  final Curve curve;
  final bool isRepeat;
  final bool reverse;
  final Matrix4? transform;
  const MinFlipAnimation({
    super.key,
    required this.child,
    this.reverse = false,
    this.listener,
    this.onEnd,
    this.duration = const Duration(milliseconds: 1000),
    this.begin = 0.0,
    this.end = 3.14159,
    this.curve = Curves.linear,
    this.isRepeat = false,
    this.transform,
  });

  @override
  Widget build(BuildContext context) {
    return child.flipAnimation(
      duration: duration,
      begin: begin,
      end: end,
      curve: curve,
      reverse: reverse,
      isRepeat: isRepeat,
      listener: listener,
      onEnd: onEnd,
      transform: transform,
    );
  }
}
