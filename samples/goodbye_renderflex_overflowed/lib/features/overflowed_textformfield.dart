// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class OverflowedTextformfieldScreen extends StatelessWidget {
  OverflowedTextformfieldScreen({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Text form field overflowed'),
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
      body: GestureDetector(
        onTap: () {
          final currentScope = FocusScope.of(context);
          if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.purple[600]!,
                Colors.purple[400]!,
                Colors.purple[200]!,
              ],
            ),
          ),
          child: Center(
            /// Fix option 1: wrap `Column` with `SingleChildScrollView` if you want it to scroll
            child: Column(
              children: <Widget>[
                /// Fix option 2: wrap children with `Expanded` or `Flexible` to resize to fit viewport
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: const Placeholder(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
