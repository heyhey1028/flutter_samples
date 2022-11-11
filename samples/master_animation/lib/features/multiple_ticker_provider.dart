import 'dart:math';

import 'package:flutter/material.dart';
import 'package:master_animation/widgets/main_drawer.dart';

class MultipleTickerProvider extends StatefulWidget {
  const MultipleTickerProvider({super.key});

  @override
  State<MultipleTickerProvider> createState() => _MultipleTickerProviderState();
}

//  mixin TickerProviderStateMixin that could provide multiple tickers
class _MultipleTickerProviderState extends State<MultipleTickerProvider>
    with TickerProviderStateMixin {
  static final _pageColor = Colors.brown[300];

  // to animate separately, prepare a multiple AnimationControllers
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
    // define duration and vsync for each AnimationController separately
    rotateController = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);

    alignController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);

    // define Tween for each Animation
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

    // create Animation using each AnimationController
    alignmAnimation = alignController.drive(alignTween);
    rotateAnimation = rotateController.drive(rotateTween);

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
        backgroundColor: _pageColor,
        title: const Text('Multiple Ticker Provider'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: const MainDrawer(),
      body: AnimatedBuilder(
        // wrap Animations with Listenable.merge to listen to multiple animation
        animation: Listenable.merge([
          rotateController,
          alignController,
        ]),
        builder: (context, _) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: alignmAnimation.value, // bind animation to widget
                child: Transform.rotate(
                  angle: rotateAnimation.value,
                  child: const Text('Hello world!!'),
                ),
              )
            ],
          );
        },
      ),
      // trigger multiple AnimationControllers separately
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
              backgroundColor: _pageColor,
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
              backgroundColor: _pageColor,
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
