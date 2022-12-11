import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goodbye_renderflex_overflowed/widgets/app_scaffold.dart';

class ListviewUnboundedScreen extends ConsumerWidget {
  const ListviewUnboundedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      title: const Text('Size overflowed'),
      color: Colors.green,
      body: Center(
        child: ListView(
          children: [
            ListView(
              children: [
                for (int i = 1; i < 10; i++)
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 100,
                    width: double.infinity,
                    color: Colors.yellow,
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
