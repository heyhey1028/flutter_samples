import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:generate_riverpod/screens/async_value_notifier_screen/providers/async_value_notifier_screen_controller.dart';
import 'package:generate_riverpod/widgets/app_scaffold.dart';

class AsyncValueNotifierScreen extends ConsumerWidget {
  const AsyncValueNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(asyncValueNotifierScreenControllerProvider);

    return AppScaffold(
      title: const Text('AsyncValue with Notifier Sample'),
      color: Colors.lime,
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          state.when(
            data: (data) => Text('$data', style: const TextStyle(fontSize: 40)),
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) =>
                Text('$error', style: const TextStyle(fontSize: 40)),
          )
        ],
      )),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            label: const Text('Random'),
            heroTag: 'async',
            onPressed: () async {
              await ref
                  .read(asyncValueNotifierScreenControllerProvider.notifier)
                  .getRandomNum();
            },
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () {
              ref
                  .read(asyncValueNotifierScreenControllerProvider.notifier)
                  .increment();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
