import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:generate_riverpod/screens/async_notifier_screen/providers/async_notifier_screen_controller.dart';
import 'package:generate_riverpod/widgets/app_scaffold.dart';

class AsyncNotifierScreen extends ConsumerWidget {
  const AsyncNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(asyncNotifierScreenControllerProvider);

    return AppScaffold(
      title: const Text('AsyncNotifierProvider Sample'),
      color: Colors.purple,
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          state.when(
            data: (data) => Text(
              data,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Text(
              '$error',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      )),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            label: Text('Delete'),
            heroTag: 'delete',
            onPressed: () {
              ref.read(asyncNotifierScreenControllerProvider.notifier).delete();
            },
          ),
          const SizedBox(width: 20),
          FloatingActionButton.extended(
            label: Text('Get'),
            heroTag: 'get',
            onPressed: () async {
              await ref
                  .read(asyncNotifierScreenControllerProvider.notifier)
                  .setNewWord();
            },
          ),
        ],
      ),
    );
  }
}
