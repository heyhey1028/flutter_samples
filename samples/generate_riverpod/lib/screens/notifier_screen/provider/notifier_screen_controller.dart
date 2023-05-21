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

  Future<void> getRandomNum() async {
    final response = await http.get(Uri.parse(
        'https://www.random.org/integers/?num=1&min=1&max=100&col=1&base=10&format=plain&rnd=new'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      state = jsonResponse as int;
    }
  }
}
