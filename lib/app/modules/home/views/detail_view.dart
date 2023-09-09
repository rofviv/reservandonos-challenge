import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/shared.dart';
import '../data/models/place.dart';
import '../home_controller.dart';
import '../widgets/info_place_detail.dart';
import '../widgets/item_place.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.place});
  static String route = '/detail-view/';

  final Place place;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.92),
      appBar: AppBar(
        elevation: 0,
        title: Text(place.name ?? ""),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: place.id.toString(),
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: CachedNetworkImage(
                            imageUrl: place.imageUrl ??
                                "http://via.placeholder.com/350x150",
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InfoPlace(
                            icon: Icons.bookmark_border_outlined,
                            color: Colors.purple,
                            text: place.categories ?? "",
                          ),
                          const SizedBox(height: 2),
                          InfoPlace(
                            icon: Icons.timelapse_outlined,
                            color: Colors.blue.shade900,
                            text: place.schedule ?? "",
                          ),
                          const SizedBox(height: 2),
                          InfoPlace(
                            icon: Icons.money,
                            color: Colors.green,
                            text: place.priceRange ?? "",
                          ),
                          const SizedBox(height: 2),
                          InfoPlace(
                            icon: Icons.location_on,
                            color: Colors.amber,
                            text: place.location ?? "",
                          ),
                          const SizedBox(height: 2),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (_) {
                  if (controller.loadingDetail) {
                    return Column(
                      children: [
                        Skeleton(
                          height: 200,
                          width: maxWidth(context),
                        ),
                        Skeleton(
                          height: 140,
                          width: maxWidth(context),
                        ),
                        Skeleton(
                          height: 200,
                          width: maxWidth(context),
                        ),
                      ],
                    );
                  }
                  if (controller.placeDetail == null) {
                    return const Text("Place detail no loaded");
                  }
                  return InfoPlaceDetail(controller: controller, place: place);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

