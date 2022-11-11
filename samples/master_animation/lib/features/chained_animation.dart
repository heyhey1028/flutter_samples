import 'dart:math';

import 'package:flutter/material.dart';
import 'package:master_animation/widgets/main_drawer.dart';

class ChainedAnimation extends StatefulWidget {
  const ChainedAnimation({super.key});

  @override
  State<ChainedAnimation> createState() => _ChainedAnimationState();
}

class _ChainedAnimationState extends State<ChainedAnimation>
    with SingleTickerProviderStateMixin {
  static final _pageColor = Colors.red[300];

  late AnimationController controller;
  late Tween<Alignment> alignTween;
  late Tween<double> rotateTween;
  late Tween<double> opacityTween;
  late Animation<Alignment> alignAnimation;
  late Animation<double> rotateAnimation;
  late Animation<double> opacityAnimation;
  bool animateCompleted = false;

  @override
  void initState() {
    controller =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);

    // will apply align、rotation, opacity animation to single widget
    alignTween = Tween(begin: Alignment.topCenter, end: Alignment.center);
    rotateTween = Tween(begin: 0, end: pi * 8);
    opacityTween = Tween(begin: 1, end: 0);
    alignAnimation = CurvedAnimation(
      parent: controller,
      // 1. define start and end timing for Interval
      curve: const Interval(0, 0.5, curve: Curves.ease),
    ).drive(alignTween);

    // 2. bind Interval to AnimationController using CurvedAnimation
    rotateAnimation = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.5, 0.7, curve: Curves.ease),
    ).drive(rotateTween);

    // 3. create Animation by AnimationController x Tween
    opacityAnimation = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.7, 1, curve: Curves.ease),
    ).drive(opacityTween);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _pageColor,
        title: const Text('Chained Animation'),
      ),
      drawer: const MainDrawer(),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return Opacity(
            opacity: opacityAnimation
                .value, // <<< 4. bind animation created using Interval
            child: Align(
              alignment: alignAnimation.value, // <<< 4.
              child: Transform.rotate(
                angle: rotateAnimation.value, // <<< 4.
                child: const Text('Hello world!'),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!animateCompleted) {
            controller.forward().whenComplete(() {
              setState(() => animateCompleted = true);
            });
            return;
          }
          controller.reverse().whenComplete(
            () {
              setState(() => animateCompleted = false);
            },
          );
        },
        backgroundColor: _pageColor,
        child: const Icon(
          Icons.bolt,
          color: Colors.black,
        ),
      ),
    );
  }
}
