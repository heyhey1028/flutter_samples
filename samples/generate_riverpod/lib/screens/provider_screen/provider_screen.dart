import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:generate_riverpod/screens/provider_screen/providers/provider_screen_controller.dart';
import 'package:generate_riverpod/widgets/app_scaffold.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(providerScreenControllerProvider);

    return AppScaffold(
      color: Colors.blue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Provider page'),
            Text(state),
          ],
        ),
      ),
    );
  }
}
