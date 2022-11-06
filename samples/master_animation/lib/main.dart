// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import './firebase_options.dart';
import './widgets/app_scaffold.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              // height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.blue[900]!,
                    Colors.blue[600]!,
                    Colors.blue[400]!,
                  ],
                ),
              ),
              child: const Center(
                  child: Text('Welcome to master_animation_samples')),
            ),
          ),
        ],
      ),
    );
  }
}
