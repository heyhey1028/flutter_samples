import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'async_value_notifier_screen_controller.g.dart';

@riverpod
class AsyncValueNotifierScreenController
    extends _$AsyncValueNotifierScreenController {
  @override
  AsyncValue<int> build() => const AsyncValue.loading();

  void increment() {
    state = AsyncValue.data((state.value ?? 0) + 1);
  }

  Future<void> incrementAsync() async {
    final response = await http.get(
        Uri.parse('https://randomnumberapi.com/api/v1.0/random?min=0&max=100'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      state = AsyncValue.data(jsonResponse[0]);
    }
  }
}
