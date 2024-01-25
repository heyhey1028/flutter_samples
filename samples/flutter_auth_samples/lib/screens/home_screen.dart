import 'package:flutter/material.dart';
import 'package:flutter_auth_samples/global/app_routes.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: [
          GestureDetector(
            onTap: () {
              context.go(Routes.googleSignIn);
            },
            child: const GridTile(
              child: Icon(Icons.abc),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.go(Routes.httpGooglePhoto);
            },
            child: const GridTile(
              child: Icon(Icons.ac_unit),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.go(Routes.functionsGooglePhoto);
            },
            child: const GridTile(
              child: Icon(Icons.ac_unit),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.go(Routes.oauthGooglePhoto);
            },
            child: const GridTile(
              child: Icon(Icons.ac_unit),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.go(Routes.functionsOauthGooglePhoto);
            },
            child: const GridTile(
              child: Icon(Icons.ac_unit),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.go(Routes.httpOauthGooglePhoto);
            },
            child: const GridTile(
              child: Icon(Icons.ac_unit),
            ),
          ),
          // Add more grid items with icons and navigation
        ],
      ),
    );
  }
}
