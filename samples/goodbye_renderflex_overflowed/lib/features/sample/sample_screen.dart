import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goodbye_renderflex_overflowed/widgets/app_scaffold.dart';

class SampleScreen extends ConsumerWidget {
  const SampleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      body: Center(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
            Container(
              margin: const EdgeInsets.all(5),
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
            Container(
              margin: const EdgeInsets.all(5),
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
            Container(
              margin: const EdgeInsets.all(5),
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
