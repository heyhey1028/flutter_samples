import 'package:flutter/material.dart';
import 'package:flutter_auth_samples/screens/functions_google_photo_screen.dart';
import 'package:flutter_auth_samples/screens/functions_oauth_google_photo_screen.dart';
import 'package:flutter_auth_samples/screens/google_sign_in_screen.dart';
import 'package:flutter_auth_samples/screens/home_screen.dart';
import 'package:flutter_auth_samples/screens/http_google_photo_screen.dart';
import 'package:flutter_auth_samples/screens/http_oauth_google_photo_screen.dart';
import 'package:flutter_auth_samples/screens/oauth_google_photo_screen.dart';
import 'package:go_router/go_router.dart';

part 'app_routes.g.dart';

mixin Routes {
  static const String home = '/home';
  static const String googleSignIn = 'google-sign-in';
  static const String httpGooglePhoto = 'http-google-photo';
  static const String oauthGooglePhoto = 'oauth-google-photo';
  static const String functionsGooglePhoto = 'functions-google-photo';
  static const String httpOauthGooglePhoto = 'http-oauth-google-photo';
  static const String functionsOauthGooglePhoto = 'functions-oauth-google-photo';
}

final appRoutes = [
  GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const HomeScreen(),
          ),
      routes: [
        GoRoute(
          path: Routes.googleSignIn,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const GoogleSignInScreen(),
          ),
        ),
        GoRoute(
          path: Routes.httpGooglePhoto,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const HttpGooglePhotoScreen(),
          ),
        ),
        GoRoute(
          path: Routes.oauthGooglePhoto,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const OauthGooglePhotoScreen(),
          ),
        ),
        GoRoute(
          path: Routes.functionsGooglePhoto,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const FunctionsGooglePhotoScreen(),
          ),
        ),
        GoRoute(
          path: Routes.httpOauthGooglePhoto,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const HttpOauthGooglePhotoScreen(),
          ),
        ),
        GoRoute(
          path: Routes.functionsOauthGooglePhoto,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const FunctionsOauthGooglePhotoScreen(),
          ),
        ),
      ]),
];

@TypedGoRoute<HomeRouteData>(
  path: Routes.home,
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<GoogleSignInRouteData>(path: Routes.googleSignIn),
    TypedGoRoute<HttpGooglePhotoRouteData>(path: Routes.httpGooglePhoto),
    TypedGoRoute<OauthGooglePhotoRouteData>(path: Routes.oauthGooglePhoto),
    TypedGoRoute<FunctionsGooglePhotoRouteData>(path: Routes.functionsGooglePhoto),
    TypedGoRoute<HttpOauthGooglePhotoRouteData>(path: Routes.httpOauthGooglePhoto),
    TypedGoRoute<FunctionsOauthGooglePhotoRouteData>(path: Routes.functionsOauthGooglePhoto),
  ],
)
class HomeRouteData extends GoRouteData {
  const HomeRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

class GoogleSignInRouteData extends GoRouteData {
  const GoogleSignInRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const GoogleSignInScreen();
  }
}

class HttpGooglePhotoRouteData extends GoRouteData {
  const HttpGooglePhotoRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HttpGooglePhotoScreen();
  }
}

class OauthGooglePhotoRouteData extends GoRouteData {
  const OauthGooglePhotoRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OauthGooglePhotoScreen();
  }
}

class FunctionsGooglePhotoRouteData extends GoRouteData {
  const FunctionsGooglePhotoRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FunctionsGooglePhotoScreen();
  }
}

class HttpOauthGooglePhotoRouteData extends GoRouteData {
  const HttpOauthGooglePhotoRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HttpOauthGooglePhotoScreen();
  }
}

class FunctionsOauthGooglePhotoRouteData extends GoRouteData {
  const FunctionsOauthGooglePhotoRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FunctionsOauthGooglePhotoScreen();
  }
}
