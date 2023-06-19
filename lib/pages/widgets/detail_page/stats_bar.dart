import 'package:flutter/material.dart';

class StatusBar extends StatefulWidget {
  final String stat;
  final int currentValue;
  final int _maxValue = 180;

  const StatusBar({
    super.key,
    required this.stat,
    required this.currentValue,
  });

  @override
  State<StatusBar> createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(
            begin: 0,
            end: widget.currentValue.toDouble() / widget._maxValue.toDouble())
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeOut));

    _animationController.forward();
  }

  @override
  void didUpdateWidget(StatusBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _animation = Tween<double>(
            begin: 0,
            end: widget.currentValue.toDouble() / widget._maxValue.toDouble())
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeOut));

    _animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 8,
          child: Text(widget.stat),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: SizedBox(
            height: 20,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext context, Widget? child) {
                return ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: LinearProgressIndicator(
                    value: _animation.value,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
