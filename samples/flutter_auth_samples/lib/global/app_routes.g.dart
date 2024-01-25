// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRouteData,
    ];

RouteBase get $homeRouteData => GoRouteData.$route(
      path: '/home',
      factory: $HomeRouteDataExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'google-sign-in',
          factory: $GoogleSignInRouteDataExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'http-google-photo',
          factory: $HttpGooglePhotoRouteDataExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'oauth-google-photo',
          factory: $OauthGooglePhotoRouteDataExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'functions-google-photo',
          factory: $FunctionsGooglePhotoRouteDataExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'http-oauth-google-photo',
          factory: $HttpOauthGooglePhotoRouteDataExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'functions-oauth-google-photo',
          factory: $FunctionsOauthGooglePhotoRouteDataExtension._fromState,
        ),
      ],
    );

extension $HomeRouteDataExtension on HomeRouteData {
  static HomeRouteData _fromState(GoRouterState state) => const HomeRouteData();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GoogleSignInRouteDataExtension on GoogleSignInRouteData {
  static GoogleSignInRouteData _fromState(GoRouterState state) =>
      const GoogleSignInRouteData();

  String get location => GoRouteData.$location(
        '/home/google-sign-in',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HttpGooglePhotoRouteDataExtension on HttpGooglePhotoRouteData {
  static HttpGooglePhotoRouteData _fromState(GoRouterState state) =>
      const HttpGooglePhotoRouteData();

  String get location => GoRouteData.$location(
        '/home/http-google-photo',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $OauthGooglePhotoRouteDataExtension on OauthGooglePhotoRouteData {
  static OauthGooglePhotoRouteData _fromState(GoRouterState state) =>
      const OauthGooglePhotoRouteData();

  String get location => GoRouteData.$location(
        '/home/oauth-google-photo',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $FunctionsGooglePhotoRouteDataExtension
    on FunctionsGooglePhotoRouteData {
  static FunctionsGooglePhotoRouteData _fromState(GoRouterState state) =>
      const FunctionsGooglePhotoRouteData();

  String get location => GoRouteData.$location(
        '/home/functions-google-photo',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HttpOauthGooglePhotoRouteDataExtension
    on HttpOauthGooglePhotoRouteData {
  static HttpOauthGooglePhotoRouteData _fromState(GoRouterState state) =>
      const HttpOauthGooglePhotoRouteData();

  String get location => GoRouteData.$location(
        '/home/http-oauth-google-photo',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $FunctionsOauthGooglePhotoRouteDataExtension
    on FunctionsOauthGooglePhotoRouteData {
  static FunctionsOauthGooglePhotoRouteData _fromState(GoRouterState state) =>
      const FunctionsOauthGooglePhotoRouteData();

  String get location => GoRouteData.$location(
        '/home/functions-oauth-google-photo',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
