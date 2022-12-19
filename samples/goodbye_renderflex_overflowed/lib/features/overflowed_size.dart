// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goodbye_renderflex_overflowed/widgets/app_scaffold.dart';

class OverflowedSizeScreen extends ConsumerWidget {
  const OverflowedSizeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      title: const Text('Size overflowed'),
      color: Colors.indigo,
      body: Center(
        /// Fix option 1: wrap `Column` with `SingleChildScrollView` if you want it to scroll
        child: Column(
          children: [
            for (int i = 1; i < 10; i++)

              /// Fix option 2: wrap children with `Expanded` or `Flexible` to resize to fit viewport
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
