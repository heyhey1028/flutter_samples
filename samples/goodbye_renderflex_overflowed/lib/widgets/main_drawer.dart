import 'package:flutter/material.dart';
import 'package:goodbye_renderflex_overflowed/features/listview_unbounded.dart';
import 'package:goodbye_renderflex_overflowed/features/overflowed_image.dart';
import 'package:goodbye_renderflex_overflowed/features/overflowed_listview.dart';
import 'package:goodbye_renderflex_overflowed/features/overflowed_text.dart';
import 'package:goodbye_renderflex_overflowed/features/overflowed_textformfield.dart';
import 'package:goodbye_renderflex_overflowed/features/scrollable_region_overflow.dart';
import 'package:goodbye_renderflex_overflowed/features/unbounded_expanded.dart';

import '../features/overflowed_size.dart';
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
              icon: const Icon(Icons.error),
              title: 'Size overflowed',
              navigateTo: const OverflowedSizeScreen(),
            ),
            DrawerTile(
              color: Colors.green[100],
              icon: const Icon(Icons.error),
              title: 'Text overflowed',
              navigateTo: const OverflowedTextScreen(),
            ),
            DrawerTile(
              color: Colors.orange[100],
              icon: const Icon(Icons.error),
              title: 'Image overflowed',
              navigateTo: const OverflowedImageScreen(),
            ),
            DrawerTile(
              color: Colors.purple[100],
              icon: const Icon(Icons.error),
              title: 'TextFormField overflowed',
              navigateTo: OverflowedTextformfieldScreen(),
            ),
            DrawerTile(
              color: Colors.blue[100],
              icon: const Icon(Icons.error),
              title: 'Unbounded Expanded',
              navigateTo: const UnboundedExpandedScreen(),
            ),
            DrawerTile(
              color: Colors.red[100],
              icon: const Icon(Icons.error),
              title: 'Listview overflowed',
              navigateTo: const OverflowedListviewScreen(),
            ),
            DrawerTile(
              color: Colors.lime[100],
              icon: const Icon(Icons.dangerous),
              title: 'ListView unbounded',
              navigateTo: const ListviewUnboundedScreen(),
            ),
            DrawerTile(
              color: Colors.teal[100],
              icon: const Icon(Icons.dangerous),
              title: 'Scrollable overflowed',
              navigateTo: const ScrollableRegionOverflowScreen(),
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
