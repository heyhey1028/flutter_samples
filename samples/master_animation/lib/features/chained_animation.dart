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

    // align、rotation, opacityの３つのアニメーション効果を充てていきます
    alignTween = Tween(begin: Alignment.topCenter, end: Alignment.center);
    rotateTween = Tween(begin: 0, end: pi * 8);
    opacityTween = Tween(begin: 1, end: 0);

    alignAnimation = alignTween.animate(
      CurvedAnimation(
        parent: controller,
        // 1. Intervalクラスに開始タイミング、終了タイミングを指定
        curve: const Interval(0, 0.5, curve: Curves.ease),
      ),
    );
    rotateAnimation = rotateTween.animate(
      // 2. CurvedAnimationを使って、IntervalをAnimationControllerに付与
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 0.7, curve: Curves.ease),
      ),
    );
    // 3. Tween.animateメソッドを使ってAnimationクラスを生成
    opacityAnimation = opacityTween.animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.7, 1, curve: Curves.ease),
      ),
    );

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
        title: const Text('Flutter app'),
      ),
      drawer: const MainDrawer(),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return Opacity(
            opacity: opacityAnimation
                .value, // <<< 4. Intervalを付与して生成したAnimationをwidgetに紐づける
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
        backgroundColor: Colors.yellow[700],
        child: const Icon(
          Icons.bolt,
          color: Colors.black,
        ),
      ),
    );
  }
}
