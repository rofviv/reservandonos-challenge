import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../shared/shared.dart';
import '../data/models/place.dart';
import '../home_controller.dart';

class InfoPlaceDetail extends StatelessWidget {
  const InfoPlaceDetail({
    super.key,
    required this.controller,
    required this.place,
  });

  final HomeController controller;
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: maxWidth(context),
          height: 200,
          child: Stack(
            children: [
              GoogleMap(
                myLocationButtonEnabled: false,
                myLocationEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    double.parse(
                        controller.placeDetail?.geolocation?.latitude ?? "0"),
                    double.parse(
                        controller.placeDetail?.geolocation?.longitude ?? "0"),
                  ),
                  zoom: 14.4746,
                ),
                onMapCreated: (GoogleMapController controller) {
                  controller.setMapStyle(jsonEncode(mapAG));
                },
              ),
              const Positioned.fill(
                child: Center(
                  child: Icon(
                    Icons.location_on,
                    size: 40,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: white,
          ),
          child: HtmlWidget(
            controller.placeDetail!.description ?? "",
            textStyle: captionRegular,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Schedules",
                style: paragraphBold,
              ),
              const SizedBox(height: 8),
              ...(controller.placeDetail?.schedules ?? []).map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (e.weekday ?? " ").characters.first.toUpperCase() +
                            (e.weekday ?? " ").substring(1),
                        style: smallRegular,
                      ),
                      Text("${e.start ?? ""} to ${e.end ?? ""}"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: maxWidth(context),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Gallery",
                style: paragraphBold,
              ),
              const SizedBox(height: 8),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  ...(controller.placeDetail?.gallery ?? []).map(
                    (e) => Container(
                      width: 80,
                      height: 80,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: place.imageUrl ??
                            "http://via.placeholder.com/350x150",
                        placeholder: (context, url) =>
                            const CupertinoActivityIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: maxWidth(context),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Amenities",
                style: paragraphBold,
              ),
              const SizedBox(height: 8),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  ...(controller.placeDetail?.amenities ?? []).map(
                    (e) => Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Text(
                        e.name ?? "",
                        style: captionRegular.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
