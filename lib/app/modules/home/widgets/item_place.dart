import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../../shared/shared.dart';
import '../data/models/place.dart';

class ItemPlaceWidget extends StatelessWidget {
  const ItemPlaceWidget({super.key, required this.place, this.onTap});
  static String route = '/';

  final Place place;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: Row(
          children: [
            Stack(
              children: [
                Hero(
                  tag: place.id.toString(),
                  child: Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
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
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 1,
                    ),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.amber,
                        ),
                        Text(
                          place.score?.toStringAsFixed(0) ?? "0",
                          style: captionRegular,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name ?? "",
                    style: paragraphBold,
                  ),
                  const SizedBox(height: 5),
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
    );
  }
}

class InfoPlace extends StatelessWidget {
  const InfoPlace({
    super.key,
    required this.icon,
    required this.color,
    required this.text,
  });

  final IconData icon;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: color,
          size: 16,
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            style: captionRegular.copyWith(
              color: grey,
            ),
          ),
        ),
      ],
    );
  }
}
