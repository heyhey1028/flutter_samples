import 'package:flutter/material.dart';

class AnimationBasic extends StatefulWidget {
  const AnimationBasic({super.key});

  @override
  State<AnimationBasic> createState() => _AnimationBasicState();
}

class _AnimationBasicState extends State<AnimationBasic>
    with SingleTickerProviderStateMixin {
  // 1.   StatefulWidgetにSingleTickerProviderStateMixinをMixinする
  late AnimationController controller;
  late Tween<Alignment> tween;
  final Curve curve = Curves.ease;
  late Animation<Alignment> animation;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this, // <<< 2. このクラス自身(this)をAnimationControllerに渡す
    );
    tween = Tween(
      // <<< 3. 何の値に変換するかと始点と終点の値を決めてTweenを作る
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    tween.chain(CurveTween(curve: curve)); // <<< 4. TweenにCurveを適用して変化の曲線を変える
    animation = controller
        .drive(tween); // <<< 5. AnimationControllerとTweenを掛け合わせてAnimationを作る
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter app'),
      ),
      body: AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          return Align(
            alignment: animation.value, // <<< 6. Animationを変化させたいWidgetに紐付ける
            child: const Text('Hello world!'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward(); // <<< 7. forwardメソッドでアニメーションを開始する
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
