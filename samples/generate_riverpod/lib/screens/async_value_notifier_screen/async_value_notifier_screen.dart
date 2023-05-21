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
      color: Colors.lime,
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('AsyncValue provider by NotifierProvider'),
          state.when(
            data: (data) => Text('$data'),
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Text('$error'),
          )
        ],
      )),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () {
              ref
                  .read(asyncValueNotifierScreenControllerProvider.notifier)
                  .increment();
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'async',
            onPressed: () async {
              await ref
                  .read(asyncValueNotifierScreenControllerProvider.notifier)
                  .incrementAsync();
            },
            child: const Icon(Icons.spa),
          ),
        ],
      ),
    );
  }
}
