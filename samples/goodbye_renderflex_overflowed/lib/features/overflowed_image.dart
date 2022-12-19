// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goodbye_renderflex_overflowed/widgets/app_scaffold.dart';

class OverflowedImageScreen extends ConsumerWidget {
  const OverflowedImageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      title: const Text('Image overflowed'),
      color: Colors.orange,
      body: Center(
        /// Fix option 1: wrap `Column` with `SingleChildScrollView` if you want it to scroll
        child: Row(
          children: [
            /// Fix option 2: wrap children with `Expanded` or `Flexible` to resize to fit viewport
            Image.asset('assets/images/claw_machine.png'),
          ],
        ),
      ),
    );
  }
}
