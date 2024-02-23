import 'package:flutter/material.dart';
import 'package:min_animations/src/extension_animations/extension_animations.dart';

class MinScaleAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double begin;
  final double end;
  final Curve curve;
  final bool reverse;
  final Alignment alignment;
  final bool isRepeat;
  final void Function(AnimationController)? listener;
  final void Function()? onEnd;
  const MinScaleAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.begin = 0.0,
    this.end = 1.0,
    this.curve = Curves.easeInOut,
    this.reverse = false,
    this.alignment = Alignment.center,
    this.isRepeat = false,
    this.listener,
    this.onEnd,
  });

  @override
  Widget build(BuildContext context) {
    return child.scaleAnimation(
      duration: duration,
      begin: begin,
      end: end,
      curve: curve,
      reverse: reverse,
      alignment: alignment,
      isRepeat: isRepeat,
      listener: listener,
      onEnd: onEnd,
    );
  }
}
