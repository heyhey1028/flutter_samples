import 'package:flutter/material.dart';
import 'package:flutter_auth_samples/global/app_routes.dart';

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
              const GoogleSignInRouteData().go(context);
            },
            child: const GridTile(
              child: Icon(Icons.abc),
            ),
          ),
          GestureDetector(
            onTap: () {
              const FunctionsGooglePhotoRouteData().go(context);
            },
            child: const GridTile(
              child: Icon(Icons.ac_unit),
            ),
          ),
          GestureDetector(
            onTap: () {
              const HttpGooglePhotoRouteData().go(context);
            },
            child: const GridTile(
              child: Icon(Icons.ac_unit),
            ),
          ),
          GestureDetector(
            onTap: () {
              const OauthGooglePhotoRouteData().go(context);
            },
            child: const GridTile(
              child: Icon(Icons.ac_unit),
            ),
          ),
          GestureDetector(
            onTap: () {
              const HttpOauthGooglePhotoRouteData().go(context);
            },
            child: const GridTile(
              child: Icon(Icons.ac_unit),
            ),
          ),
          GestureDetector(
            onTap: () {
              const FunctionsOauthGooglePhotoRouteData().go(context);
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
