// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goodbye_renderflex_overflowed/widgets/app_scaffold.dart';

// Sample referred from https://www.youtube.com/watch?v=H88YOItgBqI
class OverflowedListviewScreen extends ConsumerWidget {
  const OverflowedListviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      title: const Text('Listview overflowed'),
      color: Colors.red,
      body: Center(
        child: Column(
          children: [
            /// Fix: wrap children with `Expanded` or `Flexible`
            ListView.builder(
              itemCount: 50,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    index.toString(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
