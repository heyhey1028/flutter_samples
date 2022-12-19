// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goodbye_renderflex_overflowed/widgets/app_scaffold.dart';

class ScrollableRegionOverflowScreen extends ConsumerWidget {
  const ScrollableRegionOverflowScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      title: const Text('Scrollable region overflowed'),
      color: Colors.teal,
      body: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            /// Fix: wrap child with Widgets that constraints it's width (ex. `SizedBox`, `ConstrainedBox`)
            TextField(),
          ],
        ),
      ),
    );
  }
}
