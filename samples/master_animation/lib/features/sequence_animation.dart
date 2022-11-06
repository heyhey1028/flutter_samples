import 'package:flutter/material.dart';
import 'package:master_animation/widgets/main_drawer.dart';

class SequenceAnimation extends StatefulWidget {
  const SequenceAnimation({super.key});

  @override
  State<SequenceAnimation> createState() => _SequenceAnimationState();
}

class _SequenceAnimationState extends State<SequenceAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late TweenSequence<Alignment>
      tweenSequence; // <<< define as TweenSequence, not Tween
  late Animation<Alignment> animation;

  @override
  void initState() {
    controller =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);
    tweenSequence = TweenSequence<Alignment>([
      // <<< can take in multiple TweenSequenceItem classes
      TweenSequenceItem(
          tween: Tween(begin: Alignment.topLeft, end: Alignment.topRight),
          weight:
              1 // <<< in this example, duration is 4 seconds, so weight:1 means this Tween will be applied for 1 second
          ),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1),
    ]);
    animation = controller
        .drive(tweenSequence); // <<< create Animation just like using a Tween
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
        backgroundColor: Colors.green[300],
        title: const Text('Sequence Animation'),
      ),
      drawer: const MainDrawer(),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return Align(
              alignment: animation.value, // <<< simply bind the animation
              child: const Text('Hello world!'));
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
