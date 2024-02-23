import 'package:flutter/material.dart';
import 'package:min_animations/src/extension_animations/extension_animations.dart';

class MinRotateAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double begin;
  final double end;
  final Curve curve;
  final bool reverse;
  final bool isRepeat;
  final Alignment alignment;
  final Offset origin;
  final void Function(AnimationController)? listener;
  final void Function()? onEnd;
  const MinRotateAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.begin = 0.0,
    this.end = 1.0,
    this.curve = Curves.easeInOut,
    this.reverse = false,
    this.isRepeat = false,
    this.alignment = Alignment.center,
    this.origin = Offset.zero,
    this.listener,
    this.onEnd,
  });

  @override
  Widget build(BuildContext context) {
    return child.rotateAnimation(
      duration: duration,
      begin: begin,
      end: end,
      curve: curve,
      reverse: reverse,
      isRepeat: isRepeat,
      alignment: alignment,
      origin: origin,
      listener: listener,
      onEnd: onEnd,
    );
  }
}
