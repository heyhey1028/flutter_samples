import 'package:flutter/material.dart';
import 'package:master_animation/widgets/main_drawer.dart';

class StaggeredAnimation extends StatefulWidget {
  const StaggeredAnimation({super.key});

  @override
  State<StaggeredAnimation> createState() => _StaggeredAnimationState();
}

class _StaggeredAnimationState extends State<StaggeredAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Tween<Offset> offsetTween;
  late Animation<Offset> offsetAnimation1;
  late Animation<Offset> offsetAnimation2;
  late Animation<Offset> offsetAnimation3;
  bool animateCompleted = false;

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);

    // prepare single Tween that would be applied to all of the Animations
    offsetTween = Tween(begin: const Offset(-1000, 0), end: Offset.zero);

    offsetAnimation1 = CurvedAnimation(
      parent: controller,
      // 1. define start and end time for each Intervals
      curve: const Interval(0, 0.3, curve: Curves.ease),
    ).drive(offsetTween);

    // 2. bind Interval to AnimationController using CurvedAnimation
    offsetAnimation2 = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.3, 0.7, curve: Curves.ease),
    ).drive(offsetTween);

    // 3. create Animation from AnimationController and Tween
    offsetAnimation3 = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.7, 1, curve: Curves.ease),
    ).drive(offsetTween);

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
        backgroundColor: Colors.purple[300],
        title: const Text('Staggered Animation'),
      ),
      drawer: const MainDrawer(),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Transform.translate(
                  offset: offsetAnimation1
                      .value, // 4.  bind Animation created with each Interval
                  child: const Text('Hello world!'),
                ),
                Transform.translate(
                  offset: offsetAnimation2.value, // 4.
                  child: const Text('My name is ...'),
                ),
                Transform.translate(
                  offset: offsetAnimation3.value, // 4.
                  child: const Text('heyhey1028!!'),
                ),
              ],
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
