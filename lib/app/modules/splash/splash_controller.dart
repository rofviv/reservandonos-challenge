import 'package:flutter_modular/flutter_modular.dart';

import '../home/home_module.dart';

class SplashController {
  SplashController() {
    _init();
  }

  void _init() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    Modular.to.navigate(HomeModule.route);
  }
}
