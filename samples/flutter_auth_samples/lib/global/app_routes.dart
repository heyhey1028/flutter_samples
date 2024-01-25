import 'package:flutter_auth_samples/screens/functions_google_photo_screen.dart';
import 'package:flutter_auth_samples/screens/functions_oauth_google_photo_screen.dart';
import 'package:flutter_auth_samples/screens/google_sign_in_screen.dart';
import 'package:flutter_auth_samples/screens/home_screen.dart';
import 'package:flutter_auth_samples/screens/http_google_photo_screen.dart';
import 'package:flutter_auth_samples/screens/http_oauth_google_photo_screen.dart';
import 'package:flutter_auth_samples/screens/oauth_google_photo_screen.dart';
import 'package:go_router/go_router.dart';

mixin Routes {
  static const String home = '/home';
  static const String googleSignIn = '/google-sign-in';
  static const String httpGooglePhoto = '/http-google-photo';
  static const String oauthGooglePhoto = '/oauth-google-photo';
  static const String functionsGooglePhoto = '/functions-google-photo';
  static const String httpOauthGooglePhoto = '/http-oauth-google-photo';
  static const String functionsOauthGooglePhoto = '/functions-oauth-google-photo';
}

final appRoutes = [
  GoRoute(
    path: Routes.home,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: HomeScreen(),
    ),
  ),
  GoRoute(
    path: Routes.googleSignIn,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: GoogleSignInScreen(),
    ),
  ),
  GoRoute(
    path: Routes.httpGooglePhoto,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: HttpGooglePhotoScreen(),
    ),
  ),
  GoRoute(
    path: Routes.oauthGooglePhoto,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: OauthGooglePhotoScreen(),
    ),
  ),
  GoRoute(
    path: Routes.functionsGooglePhoto,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: FunctionsGooglePhotoScreen(),
    ),
  ),
  GoRoute(
    path: Routes.httpOauthGooglePhoto,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: HttpOauthGooglePhotoScreen(),
    ),
  ),
  GoRoute(
    path: Routes.functionsOauthGooglePhoto,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: FunctionsOauthGooglePhotoScreen(),
    ),
  ),
];
