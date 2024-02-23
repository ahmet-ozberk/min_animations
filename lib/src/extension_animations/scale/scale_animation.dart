part of '../extension_animations.dart';

class _ScaleAnimations extends StatefulWidget {
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

  const _ScaleAnimations({
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
  State<_ScaleAnimations> createState() => __ScaleAnimationsState();
}

class __ScaleAnimationsState extends State<_ScaleAnimations>
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
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _animation.value,
      alignment: widget.alignment,
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
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (widget.isRepeat) {
          _controller.reverse();
        }
      } else if (status == AnimationStatus.dismissed) {
        if (widget.isRepeat) {
          _controller.forward();
        }
      }
    });
  }

  void _reverseExecute() {
    if (widget.reverse) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }
}
