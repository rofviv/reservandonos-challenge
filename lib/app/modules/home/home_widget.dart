import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/shared.dart';
import 'home_controller.dart';
import 'home_module.dart';
import 'views/detail_view.dart';
import 'widgets/item_place.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});
  static String route = '/';

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Reservándonos challenge"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Builder(
                builder: (_) {
                  if (controller.loading) {
                    return Skeleton(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 10),
                      height: 120,
                      width: maxWidth(context),
                      length: 3,
                    );
                  }
                  if (controller.placeResponse == null) {
                    return const Text("Data not loaded");
                  }
                  return Column(
                    children: [
                      ...controller.places.map(
                        (e) => ItemPlaceWidget(
                          place: e,
                          onTap: () {
                            controller.getPlaceDetail(e.id);
                            Modular.to.pushNamed(
                              HomeModule.route + DetailView.route.substring(1),
                              arguments: e,
                            );
                          },
                        ),
                      ),
                      if (controller.loadingMore)
                        const CupertinoActivityIndicator(),
                      if (controller.showMore && !controller.loadingMore)
                        TextButton(
                          onPressed: () {
                            controller.getPlaces();
                          },
                          child: const Text("Load more"),
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
