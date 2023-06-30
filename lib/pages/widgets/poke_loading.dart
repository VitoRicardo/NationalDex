import 'package:flutter/material.dart';

class PokeLoading extends StatefulWidget {
  final Color color;
  const PokeLoading({Key? key, required this.color}) : super(key: key);

  @override
  State<PokeLoading> createState() => _PokeLoadingState();
}

class _PokeLoadingState extends State<PokeLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
      child: SizedBox(
        height: 96,
        width: 96,
        child: Image.asset(
          'assets/pokeball_svg.png',
          color: widget.color,
        ),
      ),
    );
  }
}
