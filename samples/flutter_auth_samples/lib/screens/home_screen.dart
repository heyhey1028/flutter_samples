import 'package:flutter/material.dart';
import 'package:flutter_auth_samples/global/app_routes.dart';
import 'package:flutter_auth_samples/widgets/navigate_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
        crossAxisCount: 3,
        childAspectRatio: 0.9,
        mainAxisSpacing: 8,
        children: [
          NavigateGrid(
            image: ImageType.googlesignin,
            onPressed: () => const GoogleSignInRouteData().go(context),
          ),
          NavigateGrid(
            image: ImageType.functions,
            onPressed: () => const FunctionsGooglePhotoRouteData().go(context),
          ),
          NavigateGrid(
            image: ImageType.http,
            onPressed: () => const HttpGooglePhotoRouteData().go(context),
          ),
          NavigateGrid(
            image: ImageType.oauth,
            onPressed: () => const OauthGooglePhotoRouteData().go(context),
          ),
          NavigateGrid(
            image: ImageType.httpoauth,
            onPressed: () => const HttpOauthGooglePhotoRouteData().go(context),
          ),
          NavigateGrid(
            image: ImageType.functionsoauth,
            onPressed: () => const FunctionsOauthGooglePhotoRouteData().go(context),
          ),
        ],
      ),
    );
  }
}
