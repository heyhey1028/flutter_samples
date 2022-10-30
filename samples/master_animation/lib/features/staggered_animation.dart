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
  late Tween<Offset> offsetTween1;
  late Tween<Offset> offsetTween2;
  late Tween<Offset> offsetTween3;
  late Animation<Offset> offsetAnimation1;
  late Animation<Offset> offsetAnimation2;
  late Animation<Offset> offsetAnimation3;
  bool animateCompleted = false;

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);

    // align、rotation, opacityの３つのアニメーション効果を充てていきます
    offsetTween1 = Tween(begin: const Offset(-1000, 0), end: Offset.zero);
    offsetTween2 = Tween(begin: const Offset(-1000, 0), end: Offset.zero);
    offsetTween3 = Tween(begin: const Offset(-1000, 0), end: Offset.zero);

    // 3. Tween.animateメソッドを使ってAnimationクラスを生成
    offsetAnimation1 = offsetTween1.animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.3, curve: Curves.ease),
      ),
    );
    offsetAnimation2 = offsetTween2.animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.3, 0.7, curve: Curves.ease),
      ),
    );
    offsetAnimation3 = offsetTween3.animate(
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
                  offset: offsetAnimation1.value,
                  child: const Text('Hello world!'),
                ),
                Transform.translate(
                  offset: offsetAnimation2.value,
                  child: const Text('My name is ...'),
                ),
                Transform.translate(
                  offset: offsetAnimation3.value,
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
