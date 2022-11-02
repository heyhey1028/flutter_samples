import 'package:flutter/material.dart';
import 'package:master_animation/widgets/main_drawer.dart';

class ImplitAndExplicit extends StatefulWidget {
  const ImplitAndExplicit({super.key});

  @override
  State<ImplitAndExplicit> createState() => _ImplitAndExplicitState();
}

class _ImplitAndExplicitState extends State<ImplitAndExplicit>
    with SingleTickerProviderStateMixin {
  // ExplicitAnimatedWidgetに渡すAnimationを定義
  late AnimationController explicitController;
  late Tween<double> explicitTween;
  late Animation<double> explicitAnimation;
  double implicitScale = 1;

  @override
  void initState() {
    // ExplicitAnimatedWidgetに渡すAnimationを生成
    explicitController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    explicitTween = Tween(begin: 1, end: 3);
    explicitAnimation = explicitController.drive(explicitTween);
    super.initState();
  }

  @override
  void dispose() {
    explicitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[300],
        title: const Text('Implicit and Explicit'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: const MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // ImplicitlyAnimatedWidget
            AnimatedScale(
              scale: implicitScale, // <<< scaleの値を渡す
              duration: const Duration(seconds: 1),
              child: const Text("Hi, I'm Implicit"),
            ),
            // ExplicitAnimatedWidget
            ScaleTransition(
              scale: explicitAnimation, // <<< 生成したAnimationを渡す
              child: const Text("Hi, I'm Explicit"),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                // ImplicitlyAnimatedWidgetに渡す値を変化させる
                if (implicitScale == 1) {
                  setState(() => implicitScale = 3);
                  return;
                }
                setState(() => implicitScale = 1);
              },
              heroTag: 'implicit',
              backgroundColor: Colors.yellow[700],
              child: const Icon(
                Icons.arrow_upward,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 20),
            FloatingActionButton(
              onPressed: () {
                // ExplicitAnimatedWidgetに渡しているAnimationを操作する
                if (!explicitController.isCompleted) {
                  explicitController.forward();
                  return;
                }
                explicitController.reverse();
              },
              heroTag: 'explicit',
              backgroundColor: Colors.yellow[700],
              child: const Icon(
                Icons.arrow_downward,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
