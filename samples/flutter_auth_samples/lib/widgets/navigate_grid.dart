import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

enum ImageType {
  googlesignin('assets/icons/google.png', 'Google Sign In'),
  http('assets/icons/http-request.png', 'Http Request'),
  functions('assets/icons/cloud-functions.png', 'Cloud Functions'),
  oauth('assets/icons/oauth2.png', 'OAuth2'),
  httpoauth('assets/icons/http-request.png', 'Http Request OAuth2'),
  functionsoauth('assets/icons/cloud-functions.png', 'Cloud Functions OAuth2');

  final String path;
  final String title;

  const ImageType(this.path, this.title);
}

class NavigateGrid extends StatelessWidget {
  const NavigateGrid({
    super.key,
    required this.image,
    this.onPressed,
  });

  final ImageType image;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox.square(
          dimension: 72,
          child: RawMaterialButton(
            onPressed: onPressed,
            elevation: 2,
            fillColor: Colors.white,
            shape: const CircleBorder(),
            child: SizedBox.square(
              dimension: 48,
              child: Image.asset(
                image.path,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Gap(4),
        // add title text widget
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            image.title,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
