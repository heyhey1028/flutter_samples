import 'dart:math';

import 'package:flutter/material.dart';
import 'package:master_animation/widgets/main_drawer.dart';

class MultipleEffect extends StatefulWidget {
  const MultipleEffect({super.key});

  @override
  State<MultipleEffect> createState() => _MultipleEffectState();
}

class _MultipleEffectState extends State<MultipleEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Tween<Alignment> alignmentTween; // <<< Tween for first animation
  late Tween<double> rotateTween; // <<< Tween for second animation
  late Animation<Alignment> alignmentAnimation; // <<< first animation
  late Animation<double> rotateAnimation; // <<< second animation

  @override
  void initState() {
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    alignmentTween = Tween(
        begin: Alignment.topCenter,
        end: Alignment
            .bottomCenter); // <<< define start and end value of alignment animation
    rotateTween = Tween(
        begin: 0,
        end: 8 * pi); // <<< define start and end value of rotation animation
    alignmentAnimation =
        controller.drive(alignmentTween); // <<< create align animation
    rotateAnimation =
        controller.drive(rotateTween); // <<< create rotation animation
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
        backgroundColor: Colors.orange[300],
        title: const Text('Multiple Effect'),
      ),
      drawer: const MainDrawer(),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return Align(
            alignment: alignmentAnimation.value, // <<< bind align animation
            child: Transform.rotate(
              angle: rotateAnimation.value, // <<< bind rotation animation
              child: const Text('Hello world!'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward();
        },
        backgroundColor: Colors.yellow[700],
        child: const Icon(
          Icons.bolt,
          color: Colors.black,
        ),
      ),
    );
  }
}
