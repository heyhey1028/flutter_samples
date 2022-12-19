// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goodbye_renderflex_overflowed/widgets/app_scaffold.dart';

class UnboundedListViewScreen extends ConsumerWidget {
  const UnboundedListViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      title: const Text('Unbounded ListView'),
      color: Colors.lime,
      body: Center(
        child: ListView(
          children: [
            /// Fix option 1: wrap `ListView` with Widgets that constraints it's height (ex. `SizedBox`, `ConstrainedBox`)
            SizedBox(
              height: 300,
              child: ListView(
                /// Fix option 2: add `shrinkWrap:true` to make `ListView` into children's size
                shrinkWrap: true,
                children: [
                  for (int i = 1; i < 5; i++)
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 100,
                      width: double.infinity,
                      color: Colors.yellow,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
