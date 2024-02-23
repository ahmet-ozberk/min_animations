import 'package:flutter/material.dart';
import 'package:min_animations/min_animations.dart';

class MinFadeAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double begin;
  final double end;
  final Curve curve;
  final bool reverse;
  final bool isRepeat;
  final void Function(AnimationController)? listener;
  final void Function()? onEnd;
  const MinFadeAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.begin = 0.0,
    this.end = 1.0,
    this.curve = Curves.easeInOut,
    this.reverse = false,
    this.isRepeat = false,
    this.listener,
    this.onEnd,
  });

  @override
  Widget build(BuildContext context) {
    return child.fadeAnimation(
      duration: duration,
      begin: begin,
      end: end,
      curve: curve,
      reverse: reverse,
      isRepeat: isRepeat,
      listener: listener,
      onEnd: onEnd,
    );
  }
}
