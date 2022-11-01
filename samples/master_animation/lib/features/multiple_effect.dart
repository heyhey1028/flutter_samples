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
  late Tween<Alignment> alignmentTween; // <<< 1つ目のアニメーションのTween
  late Tween<double> rotateTween; // <<< 2つ目のアニメーションのTween
  late Animation<Alignment> alignmentAnimation; // <<< １つ目のアニメーション
  late Animation<double> rotateAnimation; // <<< ２つ目のアニメーション

  @override
  void initState() {
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    alignmentTween = Tween(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter); // <<< 位置のアニメーションの始点と終点を定義
    rotateTween = Tween(begin: 0, end: 8 * pi); // <<< 回転のアニメーションの始点と終点を定義
    alignmentAnimation = controller.drive(alignmentTween); // <<< 位置のアニメーションを生成
    rotateAnimation = controller.drive(rotateTween); // <<< 回転のアニメーションを生成
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
            alignment: alignmentAnimation.value, // <<< 位置のアニメーション変化を適用
            child: Transform.rotate(
              angle: rotateAnimation.value, // <<< 回転のアニメーション変化を適用
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
