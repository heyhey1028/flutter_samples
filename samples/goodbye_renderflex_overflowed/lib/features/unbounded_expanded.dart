// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goodbye_renderflex_overflowed/widgets/app_scaffold.dart';

class UnboundedExpandedScreen extends ConsumerWidget {
  const UnboundedExpandedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      title: const Text('Unbounded Expanded'),
      color: Colors.indigo,
      body: SingleChildScrollView(
        child: Column(
          /// Fix: add `mainAxisSize: MainAxisSize.min`
          children: [
            /// Fix: wrap children with `Flexible` instead of `Expanded`
            const Expanded(child: Placeholder()),
            Expanded(
              child: Image.asset('assets/images/dash_game.jpeg'),
            ),
            const Expanded(child: Placeholder()),
          ],
        ),
      ),
    );
  }
}
