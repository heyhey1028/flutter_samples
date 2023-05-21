import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'async_value_notifier_screen_controller.g.dart';

@riverpod
class AsyncValueNotifierScreenController
    extends _$AsyncValueNotifierScreenController {
  @override
  AsyncValue<int> build() => const AsyncValue.data(0);

  void increment() {
    state = AsyncValue.data((state.value ?? 0) + 1);
  }

  Future<void> getRandomNum() async {
    state = const AsyncValue.loading();

    final response = await http.get(Uri.parse(
        'https://www.random.org/integers/?num=1&min=1&max=100&col=1&base=10&format=plain&rnd=new'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      state = AsyncValue.data(jsonResponse);
    }
  }
}
