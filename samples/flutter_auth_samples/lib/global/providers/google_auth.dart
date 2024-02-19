import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'google_auth.g.dart';

@riverpod
GoogleSignIn googleAuth(GoogleAuthRef ref) {
  return GoogleSignIn(
    clientId: dotenv.env['GOOGLE_CLINET_ID'],
    scopes: [
      'profile',
      'email',
      'https://www.googleapis.com/auth/photoslibrary',
    ],
  );
}
