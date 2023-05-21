import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier_screen_controller.g.dart';

@riverpod
class NotifierScreenController extends _$NotifierScreenController {
  @override
  int build() => 0;

  void increment() {
    state++;
  }

  Future<void> incrementAsync() async {
    final response = await http.get(
        Uri.parse('https://randomnumberapi.com/api/v1.0/random?min=0&max=100'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      state = jsonResponse[0];
    }
  }
}
