import 'package:flutter/material.dart';
import 'package:master_animation/widgets/main_drawer.dart';

class ImplitAndExplicit extends StatefulWidget {
  const ImplitAndExplicit({super.key});

  @override
  State<ImplitAndExplicit> createState() => _ImplitAndExplicitState();
}

class _ImplitAndExplicitState extends State<ImplitAndExplicit>
    with SingleTickerProviderStateMixin {
  static final _pageColor = Colors.cyan[300];

  // define Animation which will be binded to Transition widget
  late AnimationController explicitController;
  late Tween<double> explicitTween;
  late Animation<double> explicitAnimation;
  double implicitScale = 1; // <<< define variable for Implicit widget

  @override
  void initState() {
    // create Animation for Transition widget
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
        backgroundColor: _pageColor,
        title: const Text('Implicit and Explicit'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: const MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Implicit widget
            AnimatedScale(
              scale: implicitScale, // <<< passing variable
              duration: const Duration(seconds: 1),
              child: const Text("Hi, I'm Implicit"),
            ),
            // Transition widget
            ScaleTransition(
              scale: explicitAnimation, // <<< bind Animation created
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
                // change the variable passed to Implicit widget
                if (implicitScale == 1) {
                  setState(() => implicitScale = 3);
                  return;
                }
                setState(() => implicitScale = 1);
              },
              heroTag: 'implicit',
              backgroundColor: _pageColor,
              child: const Icon(
                Icons.arrow_upward,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 20),
            FloatingActionButton(
              onPressed: () {
                // controller Animation class binded to Transition widget
                if (!explicitController.isCompleted) {
                  explicitController.forward();
                  return;
                }
                explicitController.reverse();
              },
              heroTag: 'explicit',
              backgroundColor: _pageColor,
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
