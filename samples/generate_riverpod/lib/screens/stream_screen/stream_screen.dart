import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:generate_riverpod/screens/stream_screen/provider/stream_screen_controller.dart';
import 'package:generate_riverpod/widgets/app_scaffold.dart';

class StreamScreen extends ConsumerWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(streamScreenControllerProvider);

    return AppScaffold(
      color: Colors.yellow,
      title: const Text('Stream Provider Sample'),
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
