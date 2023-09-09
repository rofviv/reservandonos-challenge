import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/theme/text_style.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});
  static String route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/logo.png",
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 10),
          const Text(
            "Reservándonos Challenge",
            style: h2Bold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const CupertinoActivityIndicator(),
        ],
      ),
    );
  }
}
