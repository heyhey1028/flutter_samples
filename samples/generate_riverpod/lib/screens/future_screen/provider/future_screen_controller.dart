import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'future_screen_controller.g.dart';

@riverpod
Future<String> futureScreenController(FutureScreenControllerRef ref) async {
  final response =
      await http.get(Uri.parse('https://random-word-api.herokuapp.com/word'));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final randomWord = jsonResponse[0];

    return Future.delayed(const Duration(seconds: 1), () => randomWord);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  return 'ERROR';
}
