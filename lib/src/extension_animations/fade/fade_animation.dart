part of '../extension_animations.dart';

class _FadeAnimations extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double begin;
  final double end;
  final Curve curve;
  final bool reverse;
  final bool isRepeat;
  final void Function(AnimationController)? listener;
  final void Function()? onEnd;

  const _FadeAnimations({
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
  State<_FadeAnimations> createState() => __FadeAnimationsState();
}

class __FadeAnimationsState extends State<_FadeAnimations>
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
    return FadeTransition(
      opacity: _animation,
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
