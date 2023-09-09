import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/modules.dart';

const baseUrl = "https://dev.reservandonos.com/";

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => Dio(BaseOptions(baseUrl: baseUrl))),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      SplashModule.route,
      module: SplashModule(),
    ),
    ModuleRoute(
      HomeModule.route,
      module: HomeModule(),
    ),
  ];
}
