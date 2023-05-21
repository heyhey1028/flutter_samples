import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:generate_riverpod/screens/future_screen/provider/future_screen_controller.dart';
import 'package:generate_riverpod/widgets/app_scaffold.dart';

class FutureScreen extends ConsumerWidget {
  const FutureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(futureScreenControllerProvider);

    return AppScaffold(
      title: const Text('Future Provider Sample'),
      color: Colors.brown,
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
              error: (error, stackTrace) => Text(
                error.toString(),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              loading: () => const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
