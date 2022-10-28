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
      tweenSequence; // <<< Tweenではなく、TweenSequenceとして定義
  late Animation<Alignment> animation;

  @override
  void initState() {
    controller =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);
    tweenSequence = TweenSequence<Alignment>([
      // <<< 複数のTweenSequenceItemを受け取る
      TweenSequenceItem(
          tween: Tween(begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1 // <<< この例ではDurationが4秒なので、weight:1 = 1秒となる
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
    animation = controller.drive(
        tweenSequence); // <<< TweenとAnimationControllerでAnimationを作るのと同じ様にしてAnimationを生成
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
        title: const Text('Sequence Animation'),
      ),
      drawer: const MainDrawer(),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return Align(
              alignment: animation.value, // <<< animationを適用するだけ
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
