import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:generate_riverpod/widgets/app_scaffold.dart';

class SampleScreen extends ConsumerWidget {
  const SampleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      body: const Center(
        child: Text('Sample page'),
      ),
    );
  }
}
