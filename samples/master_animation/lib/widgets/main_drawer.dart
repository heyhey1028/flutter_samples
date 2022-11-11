import 'package:flutter/material.dart';
import 'package:master_animation/features/chained_animation.dart';
import 'package:master_animation/features/implict_and_explicit.dart';
import 'package:master_animation/features/multiple_effect.dart';
import 'package:master_animation/features/multiple_ticker_provider.dart';
import 'package:master_animation/features/sequence_animation.dart';
import 'package:master_animation/features/staggered_animation.dart';

import '../features/animation_basic.dart';
import '../main.dart';

const tileContentColor = Colors.black87;

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[100]!,
                    foregroundImage:
                        const AssetImage('assets/images/flutter_logo.png'),
                    radius: 50,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text('MASTER ANIMATION'),
                ],
              ),
            ),
            DrawerTile(
              color: Colors.lightBlue[100],
              icon: const Icon(
                Icons.home,
                color: tileContentColor,
              ),
              title: 'HOME',
              navigateTo: const MyHomePage(),
            ),
            DrawerTile(
              color: Colors.indigo[100],
              icon: const Icon(
                Icons.start,
                color: tileContentColor,
              ),
              title: 'BASIC',
              navigateTo: const AnimationBasic(),
            ),
            DrawerTile(
              color: Colors.orange[100],
              icon: const Icon(
                Icons.multiple_stop,
                color: tileContentColor,
              ),
              title: 'MULTIPLE EFFECT',
              navigateTo: const MultipleEffect(),
            ),
            DrawerTile(
              color: Colors.green[100],
              icon: const Icon(
                Icons.cyclone,
                color: tileContentColor,
              ),
              title: 'SEQUENCE ANIMATION',
              navigateTo: const SequenceAnimation(),
            ),
            DrawerTile(
              color: Colors.red[100],
              icon: const Icon(
                Icons.bubble_chart,
                color: tileContentColor,
              ),
              title: 'CHAINED ANIMATION',
              navigateTo: const ChainedAnimation(),
            ),
            DrawerTile(
              color: Colors.purple[100],
              icon: const Icon(
                Icons.bar_chart,
                color: tileContentColor,
              ),
              title: 'STAGGERED ANIMATION',
              navigateTo: const StaggeredAnimation(),
            ),
            DrawerTile(
              color: Colors.brown[100],
              icon: const Icon(
                Icons.multiline_chart,
                color: tileContentColor,
              ),
              title: 'MULTIPLE TICKER PROVIDER',
              navigateTo: const MultipleTickerProvider(),
            ),
            DrawerTile(
              color: Colors.cyan[100],
              icon: const Icon(
                Icons.add_link,
                color: tileContentColor,
              ),
              title: 'IMPLICIT, EXPLICIT',
              navigateTo: const ImplitAndExplicit(),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    this.title,
    this.icon,
    this.color,
    this.navigateTo,
    this.fontFamily,
  });

  final String? title;
  final Icon? icon;
  final Color? color;
  final Widget? navigateTo;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: color,
      child: ListTile(
        leading: icon,
        title: Text(
          title ?? '',
          style: TextStyle(
            color: tileContentColor,
            fontFamily: fontFamily,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          color: tileContentColor,
        ),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement<void, void>(
            MaterialPageRoute(
              builder: (_) => navigateTo ?? const MyHomePage(),
            ),
          );
        },
      ),
    );
  }
}
