part of '../extension_animations.dart';

class _FlipAnimation extends StatefulWidget {
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
  const _FlipAnimation({
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
  State<_FlipAnimation> createState() => __FlipAnimationState();
}

class __FlipAnimationState extends State<_FlipAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _initialize();

    _statusListener();

    _reverseExecute();

    _controller.addListener(() {
      if (widget.listener != null) {
        widget.listener!(_controller);
      }
      if (_controller.isCompleted) {
        if (widget.onEnd != null) {
          widget.onEnd!();
        }
      }
      setState(() {});
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: widget.transform ?? Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(_animation.value),
      alignment: Alignment.center,
      child: widget.child,
    );
  }

  void _initialize() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(
      begin: widget.begin,
      end: widget.end,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    );
  }

  void _statusListener() {
    if (widget.isRepeat) {
      _controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reset();
          _controller.forward();
        }
      });
    }
  }

  void _reverseExecute() {
    if (widget.reverse) {
      _controller.reverse();
    }
  }
}