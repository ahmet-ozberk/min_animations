import 'package:flutter/material.dart';
import 'package:min_animations/src/extension_animations/extension_animations.dart';

class MinSizeAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double begin;
  final double end;
  final Curve curve;
  final bool reverse;
  final bool isRepeat;
  final Axis axis;
  final void Function(AnimationController)? listener;
  final void Function()? onEnd;
  const MinSizeAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.begin = 0.0,
    this.end = 1.0,
    this.curve = Curves.easeInOut,
    this.reverse = false,
    this.isRepeat = false,
    this.axis = Axis.vertical,
    this.listener,
    this.onEnd,
  });

  @override
  Widget build(BuildContext context) {
    return child.sizeAnimation(
      duration: duration,
      begin: begin,
      end: end,
      curve: curve,
      reverse: reverse,
      isRepeat: isRepeat,
      axis: axis,
      listener: listener,
      onEnd: onEnd,
    );
  }
}
