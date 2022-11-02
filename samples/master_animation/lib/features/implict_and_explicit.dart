import 'package:flutter/material.dart';
import 'package:master_animation/widgets/main_drawer.dart';

class ImplitAndExplicit extends StatefulWidget {
  const ImplitAndExplicit({super.key});

  @override
  State<ImplitAndExplicit> createState() => _ImplitAndExplicitState();
}

class _ImplitAndExplicitState extends State<ImplitAndExplicit>
    with SingleTickerProviderStateMixin {
  late AnimationController explicitController;
  late Tween<double> explicitTween;
  late Animation<double> explicitAnimation;
  double implicitScale = 1;

  @override
  void initState() {
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
            AnimatedScale(
              scale: implicitScale,
              duration: const Duration(seconds: 1),
              child: const Text("Hi, I'm Implicit"),
            ),
            ScaleTransition(
              scale: explicitAnimation,
              child: const Text("Hi, I'm Explicit"),
            ),
          ],
        ),
      ),
      // 複数のAnimationControllerを別々に発火する
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
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
