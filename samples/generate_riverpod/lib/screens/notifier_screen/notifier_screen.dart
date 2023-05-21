import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:generate_riverpod/screens/notifier_screen/provider/notifier_screen_controller.dart';
import 'package:generate_riverpod/widgets/app_scaffold.dart';

class NotifierScreen extends ConsumerWidget {
  const NotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notifierScreenControllerProvider);

    return AppScaffold(
      title: Text('Notifier Provider Sample'),
      color: Colors.green,
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$state',
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
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
                  .read(notifierScreenControllerProvider.notifier)
                  .getRandomNum();
            },
          ),
          SizedBox(width: 20),
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () {
              ref.read(notifierScreenControllerProvider.notifier).increment();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
