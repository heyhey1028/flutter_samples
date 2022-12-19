// ignore_for_file: prefer_single_quotes, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goodbye_renderflex_overflowed/widgets/app_scaffold.dart';

class OverflowedTextScreen extends ConsumerWidget {
  const OverflowedTextScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      title: const Text('Text overflowed'),
      color: Colors.green,
      body: Center(
        /// Fix option 1: wrap `Column` with `SingleChildScrollView` if you want it to scroll
        child: Row(
          children: const [
            /// Fix option 2: wrap children with `Expanded` or `Flexible` to resize to fit viewport
            Text("But even now, I can't shake the memory of that cat. "
                "It's not that I think about it all the time. It's just that "
                " every once in a while, the image of that cat surfaces in my "
                "mind, like an old photograph that I've filed away in some box."
                " And when it does, I find myself wondering where that cat is now, "
                "and what it's doing. It's a strange feeling, like a half-forgotten "
                "dream that comes back to you briefly in the morning."),
          ],
        ),
      ),
    );
  }
}
