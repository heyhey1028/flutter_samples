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
        child: Row(
          children: [
            Image.asset('assets/images/claw_machine.png'),
          ],
        ),
      ),
    );
  }
}
