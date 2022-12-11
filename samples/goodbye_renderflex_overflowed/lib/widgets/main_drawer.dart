import 'package:flutter/material.dart';
import 'package:goodbye_renderflex_overflowed/features/listview_unbounded.dart';
import 'package:goodbye_renderflex_overflowed/features/overflowed_image.dart';
import 'package:goodbye_renderflex_overflowed/features/overflowed_listview.dart';
import 'package:goodbye_renderflex_overflowed/features/overflowed_text_screen.dart';
import 'package:goodbye_renderflex_overflowed/features/overflowed_textformfield_screen.dart';

import '../features/overflowed_size_screen.dart';
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
                    backgroundColor: Colors.grey[100],
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
              color: Colors.lightBlue[100],
              icon: const Icon(Icons.home),
              title: 'HOME',
              navigateTo: const MyHomePage(),
            ),
            DrawerTile(
              color: Colors.indigo[100],
              icon: const Icon(Icons.notes),
              title: 'Size overflowed',
              navigateTo: const OverflowedSizeScreen(),
            ),
            DrawerTile(
              color: Colors.purple[100],
              icon: const Icon(Icons.notes),
              title: 'TextFormField overflowed',
              navigateTo: OverflowedTextformfieldScreen(),
            ),
            DrawerTile(
              color: Colors.green[100],
              icon: const Icon(Icons.notes),
              title: 'Text overflowed',
              navigateTo: const OverflowedTextScreen(),
            ),
            DrawerTile(
              color: Colors.orange[100],
              icon: const Icon(Icons.notes),
              title: 'Image overflowed',
              navigateTo: const OverflowedImageScreen(),
            ),
            DrawerTile(
              color: Colors.red[100],
              icon: const Icon(Icons.notes),
              title: 'Listview overflowed',
              navigateTo: const OverflowedListviewScreen(),
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
