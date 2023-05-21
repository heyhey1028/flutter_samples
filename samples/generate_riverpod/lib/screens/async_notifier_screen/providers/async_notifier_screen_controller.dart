import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'async_notifier_screen_controller.g.dart';

@riverpod
class AsyncNotifierScreenController extends _$AsyncNotifierScreenController {
  @override
  FutureOr<String> build() async {
    final response =
        await http.get(Uri.parse('https://random-word-api.herokuapp.com/word'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final randomWord = jsonResponse[0];
      return randomWord;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return '';
  }

  void resetWord() {
    state = const AsyncValue.loading();
  }

  Future<void> setNewWord() async {
    state = const AsyncLoading();
    state = AsyncValue.data(await getNewWord());
  }

  Future<String> getNewWord() async {
    final response =
        await http.get(Uri.parse('https://random-word-api.herokuapp.com/word'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final randomWord = jsonResponse[0];
      return randomWord;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return 'ERROR';
  }
}
