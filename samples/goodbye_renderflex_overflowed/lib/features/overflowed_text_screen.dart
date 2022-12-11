import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goodbye_renderflex_overflowed/widgets/app_scaffold.dart';

class OverflowedTextScreen extends ConsumerWidget {
  const OverflowedTextScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
        title: const Text('Text overflowed'),
        color: Colors.green,
        body: Center(
          child: Row(
            children: const [
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed'
                  ' do eiusmod tempor incididunt ut labore et dolore magna '
                  'aliqua. Ut enim ad minim veniam, quis nostrud '
                  'exercitation ullamco laboris nisi ut aliquip ex ea '
                  'commodo consequat.'),
            ],
          ),
        ));
  }
}
