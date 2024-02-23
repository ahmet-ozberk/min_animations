import 'package:flutter/material.dart';
import 'package:min_animations/src/extension_animations/extension_animations.dart';

class MinSlideAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double x;
  final double y;
  final Curve curve;
  final bool reverse;
  final bool isRepeat;
  final void Function(AnimationController)? listener;
  final void Function()? onEnd;

  const MinSlideAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.x = 0.0,
    this.y = 0.0,
    this.curve = Curves.easeInOut,
    this.reverse = false,
    this.isRepeat = false,
    this.listener,
    this.onEnd,
  });

  @override
  Widget build(BuildContext context) {
    return child.slideAnimation(
      duration: duration,
      x: x,
      y: y,
      curve: curve,
      reverse: reverse,
      isRepeat: isRepeat,
      listener: listener,
      onEnd: onEnd,
    );
  }
}
