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

    // ３つのWidgetに対して同じ変化の値を付与していくのでTweenを１つ用意
    offsetTween = Tween(begin: const Offset(-1000, 0), end: Offset.zero);

    offsetAnimation1 = CurvedAnimation(
      parent: controller,
      // 1. Intervalクラスに開始タイミング、終了タイミングを指定
      curve: const Interval(0, 0.3, curve: Curves.ease),
    ).drive(offsetTween);

    // 2. CurvedAnimationを使って、IntervalをAnimationControllerに付与
    offsetAnimation2 = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.3, 0.7, curve: Curves.ease),
    ).drive(offsetTween);

    // 3. AnimationController x TweenでAnimationクラスを生成
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
                      .value, // 4.  Intervalを付与して生成したAnimationをwidgetに紐づける
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
