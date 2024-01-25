import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class GoogleSignInScreen extends StatelessWidget {
  const GoogleSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Sign In Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: SocialLoginButton(
            buttonType: SocialLoginButtonType.google,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
