import 'package:flutter/material.dart';
import 'package:generate_riverpod/screens/async_notifier_screen/async_notifier_screen.dart';
import 'package:generate_riverpod/screens/async_value_notifier_screen/async_value_notifier_screen.dart';
import 'package:generate_riverpod/screens/future_screen/future_screen.dart';
import 'package:generate_riverpod/screens/notifier_screen/notifier_screen.dart';
import 'package:generate_riverpod/screens/provider_screen/provider_screen.dart';
import 'package:generate_riverpod/screens/stream_screen/stream_screen.dart';

import '../main.dart';

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
                  const Text('FLUTTER TOY BOX'),
                ],
              ),
            ),
            DrawerTile(
              color: Colors.lightBlue[100]!,
              icon: const Icon(Icons.home),
              title: 'HOME',
              navigateTo: const MyHomePage(),
            ),
            DrawerTile(
              color: Colors.green[100]!,
              icon: const Icon(Icons.phone),
              title: 'NOTIFIER EXAMPLE',
              navigateTo: const NotifierScreen(),
            ),
            DrawerTile(
              color: Colors.lime[100]!,
              icon: const Icon(Icons.sync),
              title: 'NOTIFIER with AsyncValue',
              navigateTo: const AsyncValueNotifierScreen(),
            ),
            DrawerTile(
              color: Colors.purple[100]!,
              icon: const Icon(Icons.deck),
              title: 'ASYNC NOTIFIER EXAMPLE',
              navigateTo: const AsyncNotifierScreen(),
            ),
            DrawerTile(
              color: Colors.blue[100]!,
              icon: const Icon(Icons.nordic_walking),
              title: 'PROVIDER EXAMPLE',
              navigateTo: const ProviderScreen(),
            ),
            DrawerTile(
              color: Colors.brown[100]!,
              icon: const Icon(Icons.wallet),
              title: 'FUTURE PROVIDER EXAMPLE',
              navigateTo: const FutureScreen(),
            ),
            DrawerTile(
              color: Colors.yellow[100]!,
              icon: const Icon(Icons.stream),
              title: 'STREAM PROVIDER EXAMPLE',
              navigateTo: const StreamScreen(),
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
          style: TextStyle(fontFamily: fontFamily),
        ),
        trailing: const Icon(Icons.chevron_right_rounded),
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
