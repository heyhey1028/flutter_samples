import 'package:flutter/material.dart';
import 'main_drawer.dart';

class AppScaffold extends StatelessWidget {
  AppScaffold({
    super.key,
    required this.body,
    this.floatingActionButton,
    this.title,
    this.color = Colors.blue,
  });

  final Widget body;
  final Widget? floatingActionButton;
  final Widget? title;
  final MaterialColor color;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: title,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.menu, size: 40), // change this size and style
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      drawer: const MainDrawer(),
      extendBodyBehindAppBar: true,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              color[600]!,
              color[400]!,
              color[200]!,
            ],
          ),
        ),
        child: body,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
