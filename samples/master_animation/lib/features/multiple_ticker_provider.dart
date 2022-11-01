import 'dart:math';

import 'package:flutter/material.dart';
import 'package:master_animation/widgets/main_drawer.dart';

class MultipleTickerProvider extends StatefulWidget {
  const MultipleTickerProvider({super.key});

  @override
  State<MultipleTickerProvider> createState() => _MultipleTickerProviderState();
}

class _MultipleTickerProviderState extends State<MultipleTickerProvider>
    with TickerProviderStateMixin {
  late AnimationController alignController;
  late AnimationController rotateController;
  late TweenSequence<Alignment> alignTween;
  late Tween<double> rotateTween;
  late Animation<Alignment> alignmAnimation;
  late Animation<double> rotateAnimation;
  bool animatingAlign = false;
  bool animatingRotation = false;

  @override
  void initState() {
    rotateController = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);

    alignController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);

    // ３つのWidgetに対して同じ変化の値を付与していくのでTweenを１つ用意
    rotateTween = Tween(begin: 0, end: 8 * pi);
    alignTween = TweenSequence<Alignment>(
      [
        TweenSequenceItem(
          tween: Tween(
            begin: Alignment.center,
            end: Alignment.topCenter,
          ),
          weight: 0.3,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          weight: 0.4,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          ),
          weight: 0.3,
        ),
      ],
    );

    alignmAnimation = alignController.drive(alignTween);
    rotateAnimation = rotateController.drive(rotateTween);

    // 2. CurvedAnimationを使って、IntervalをAnimationControllerに付与

    super.initState();
  }

  @override
  void dispose() {
    rotateController.dispose();
    alignController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Ticker Provider'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: const MainDrawer(),
      body: AnimatedBuilder(
        animation: Listenable.merge([
          rotateController,
          alignController,
        ]),
        builder: (context, _) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: alignmAnimation.value,
                child: Transform.rotate(
                  angle: rotateAnimation.value,
                  child: const Text('Hello world!!'),
                ),
              )
            ],
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                if (!animatingAlign) {
                  alignController.repeat();
                  setState(() => animatingAlign = true);
                  return;
                }
                alignController.stop();
                setState(() => animatingAlign = false);
              },
              heroTag: 'align',
              backgroundColor: Colors.yellow[700],
              child: const Icon(
                Icons.double_arrow,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 20),
            FloatingActionButton(
              onPressed: () {
                if (!animatingRotation) {
                  rotateController.repeat();
                  setState(() => animatingRotation = true);
                  return;
                }
                rotateController.stop();
                setState(() => animatingRotation = false);
              },
              heroTag: 'rotate',
              backgroundColor: Colors.yellow[700],
              child: const Icon(
                Icons.cyclone,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
