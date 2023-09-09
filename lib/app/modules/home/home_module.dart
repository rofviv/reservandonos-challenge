import 'package:flutter_modular/flutter_modular.dart';

import 'data/models/place.dart';
import 'data/repositories/home_repository.dart';
import 'home_controller.dart';
import 'home_widget.dart';
import 'views/detail_view.dart';

class HomeModule extends Module {
  static String route = '/home/';

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeRepositoryImpl(i())),
    Bind.singleton((i) => HomeController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(HomeWidget.route, child: (_, args) => const HomeWidget()),
    ChildRoute(DetailView.route, child: (_, args) => DetailView(place: args.data as Place,)),
  ];
}
