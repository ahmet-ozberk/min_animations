library extension_animations;

import 'package:flutter/material.dart';

part 'scale/scale_animation.dart';
part 'fade/fade_animation.dart';
part 'slide/slide_animation.dart';
part 'size/size_animation.dart';
part 'rotate/rotate_animation.dart';
part 'flip/flip_animation.dart';

extension ExtensionAnimations on Widget {
  Widget scaleAnimation({
    Key? key,
    required Duration duration,
    double begin = 0.0,
    double end = 1.0,
    Curve curve = Curves.linear,
    bool reverse = false,
    Alignment alignment = Alignment.center,
    bool isRepeat = false,
    Function(AnimationController)? listener,
    Function()? onEnd,
  }) {
    return _ScaleAnimations(
      key: key,
      duration: duration,
      begin: begin,
      end: end,
      curve: curve,
      reverse: reverse,
      alignment: alignment,
      isRepeat: isRepeat,
      listener: listener,
      onEnd: onEnd,
      child: this,
    );
  }

  Widget fadeAnimation({
    Key? key,
    required Duration duration,
    double begin = 0.0,
    double end = 1.0,
    Curve curve = Curves.linear,
    bool reverse = false,
    bool isRepeat = false,
    Function(AnimationController)? listener,
    Function()? onEnd,
  }) {
    return _FadeAnimations(
      key: key,
      duration: duration,
      begin: begin,
      end: end,
      curve: curve,
      reverse: reverse,
      isRepeat: isRepeat,
      listener: listener,
      onEnd: onEnd,
      child: this,
    );
  }

  Widget slideAnimation({
    Key? key,
    required Duration duration,
    double x = 10.0,
    double y = 10.0,
    Curve curve = Curves.linear,
    bool reverse = false,
    bool isRepeat = false,
    Function(AnimationController)? listener,
    Function()? onEnd,
  }) {
    return _SlideAnimations(
      key: key,
      duration: duration,
      x: x,
      y: y,
      curve: curve,
      reverse: reverse,
      isRepeat: isRepeat,
      listener: listener,
      onEnd: onEnd,
      child: this,
    );
  }

  Widget sizeAnimation({
    Key? key,
    required Duration duration,
    double begin = 0.0,
    double end = 1.0,
    Curve curve = Curves.linear,
    bool reverse = false,
    bool isRepeat = false,
    Axis axis = Axis.vertical,
    Function(AnimationController)? listener,
    Function()? onEnd,
  }) {
    return _SizeAnimations(
      key: key,
      duration: duration,
      begin: begin,
      end: end,
      curve: curve,
      reverse: reverse,
      isRepeat: isRepeat,
      listener: listener,
      axis: axis,
      onEnd: onEnd,
      child: this,
    );
  }

  Widget rotateAnimation({
    Key? key,
    required Duration duration,
    double begin = 0.0,
    double end = 1.0,
    Curve curve = Curves.linear,
    bool reverse = false,
    bool isRepeat = false,
    Alignment alignment = Alignment.center,
    Offset origin = Offset.zero,
    Function(AnimationController)? listener,
    Function()? onEnd,
  }) {
    return _RotateAnimations(
      key: key,
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
      child: this,
    );
  }

  Widget flipAnimation({
    Key? key,
    required Duration duration,
    double begin = 0.0,
    double end = 3.14159,
    Curve curve = Curves.linear,
    bool reverse = false,
    bool isRepeat = false,
    Function(AnimationController)? listener,
    Function()? onEnd,
    Matrix4? transform,
  }) {
    return _FlipAnimation(
      key: key,
      duration: duration,
      begin: begin,
      end: end,
      curve: curve,
      reverse: reverse,
      isRepeat: isRepeat,
      listener: listener,
      onEnd: onEnd,
      transform: transform,
      child: this,
    );
  }
}
