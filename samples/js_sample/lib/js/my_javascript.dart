@JS()
library my_javascript;

import 'package:js/js.dart';

@JS('basicFunction')
external void basicFunction();

@JS('functionWithArg')
external void functionWithArg(String arg);

@JS('functionUsingLibrary')
external void functionUsingLibrary(List<int> list);

@JS('functionWithObjectArg')
external void functionWithObjectArg(Person person);

@JS('')
@anonymous
class Person {
  external String get name;
  external int get age;
  external String get message;
  external factory Person({String name, int age, String message});
}

@JS('functionWithFunctionArg')
external void functionWithFunctionArg(Function func);

@JS('functionWithPromise')
external Object functionWithPromise();
