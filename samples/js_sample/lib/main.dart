import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart';

import 'js/lodash.dart';
import 'js/my_javascript.dart';
import 'widgets/app_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return AppScaffold(
      body: Center(
        child: Container(
          height: screenSize.height / 2,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SelectButton(
                name: 'basic function',
                color: Colors.blue,
                onPressed: () => basicFunction(),
              ),
              SelectButton(
                name: 'with argument',
                color: Colors.purple,
                onPressed: () => functionWithArg('POP!!'),
              ),
              SelectButton(
                name: 'using library',
                color: Colors.orange,
                onPressed: () => functionUsingLibrary([12, 56, 37, 88, 101]),
              ),
              SelectButton(
                  name: 'using library2',
                  color: Colors.pink,
                  onPressed: () => print('result: ${uniq([1, 2, 1, 3, 1])}')),
              SelectButton(
                name: 'with object argument',
                color: Colors.red,
                onPressed: () => functionWithObjectArg(
                  Person(
                    name: 'John',
                    age: 52,
                    message: "Hi, I'm John!!",
                  ),
                ),
              ),
              SelectButton(
                name: 'with function argument',
                color: Colors.lime,
                onPressed: () {
                  functionWithFunctionArg(allowInterop(() {
                    return 125 + 25;
                  }));
                },
              ),
              SelectButton(
                name: 'with promise',
                color: Colors.green,
                onPressed: () async {
                  await promiseToFuture(functionWithPromise());
                  print('execution finished');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectButton extends StatelessWidget {
  const SelectButton({
    super.key,
    this.color = Colors.blue,
    this.name = '',
    this.onPressed,
  });

  final Color color;
  final String name;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          // side: BorderSide(
          //   color: color, //枠線の色
          // ),
          backgroundColor: color),
      onPressed: onPressed,
      child: Text(
        name,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
