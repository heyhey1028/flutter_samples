import 'package:flutter/material.dart';
import 'package:master_animation/widgets/main_drawer.dart';

class AnimationBasic extends StatefulWidget {
  const AnimationBasic({super.key});

  @override
  State<AnimationBasic> createState() => _AnimationBasicState();
}

class _AnimationBasicState extends State<AnimationBasic>
    with SingleTickerProviderStateMixin {
  // 1. mixin SingleTickerProviderStateMixin to State Widget
  late AnimationController controller;
  late Tween<Alignment> tween;
  final Curve curve = Curves.ease;
  late Animation<Alignment> animation;
  static final _pageColor = Colors.indigo[300];

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this, // <<< 2. passing this class to AnimationController
    );
    tween = Tween(
      // <<< 3. declare Tween with the beginning value and ending value
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    tween.chain(
        CurveTween(curve: curve)); // <<< 4. apply transition curves to Tween
    animation = controller.drive(
        tween); // <<< 5. create Animation from AnimationController and Tween
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
        backgroundColor: _pageColor,
        title: const Text('Animation basic'),
      ),
      drawer: const MainDrawer(),
      body: AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          return Align(
            alignment: animation
                .value, // <<< 6. bind Animation to the widget you want to animate
            child: const Text('Hello world!'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward(); // <<< 7. start animating with forward method
        },
        backgroundColor: _pageColor,
        child: const Icon(
          Icons.bolt,
          color: Colors.black,
        ),
      ),
    );
  }
}
