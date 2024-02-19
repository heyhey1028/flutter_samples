import 'package:flutter/material.dart';
import 'package:flutter_auth_samples/global/providers/google_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class GoogleSignInScreen extends ConsumerStatefulWidget {
  const GoogleSignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends ConsumerState<GoogleSignInScreen> {
  late bool _isSigningIn;
  GoogleSignInAccount? account;

  @override
  void initState() {
    _isSigningIn = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Sign In Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: _isSigningIn && account != null
              ? Text(account!.displayName ?? '名無し')
              : SocialLoginButton(
                  buttonType: SocialLoginButtonType.google,
                  onPressed: () async {
                    await _signIn(ref);
                  },
                ),
        ),
      ),
      floatingActionButton: _isSigningIn
          ? FloatingActionButton(
              onPressed: () => _signOut(ref),
              child: const Icon(Icons.logout),
            )
          : null,
    );
  }

  Future<void> _signIn(WidgetRef ref) async {
    final googleSignIn = ref.read(googleAuthProvider);
    try {
      final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();

      if (googleAccount != null) {
        setState(() {
          _isSigningIn = true;
          account = googleAccount;
        });
        final authentication = await googleAccount.authentication;
        print('idToken:${authentication.idToken}');
        print('accessToken:${authentication.accessToken}');
      } else {
        await googleSignIn.disconnect();
      }
    } catch (e) {
      print('Error signing in with Google: $e');
    }
  }

  Future<void> _signOut(WidgetRef ref) async {
    final googleSignIn = ref.read(googleAuthProvider);
    await googleSignIn.disconnect();
    setState(() {
      _isSigningIn = false;
      account = null;
    });
  }
}
