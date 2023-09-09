class Place {
  final int id;
  final String? url;
  final bool? status;
  final bool? isFavorite;
  final int? isLite;
  final int? isClassic;
  final bool? isAmex;
  final bool? hasDelivery;
  final String? imageUrl;
  final String? logoUrl;
  final String? name;
  final String? shortName;
  final String? categories;
  final String? schedule;
  final double? score;
  final String? priceRange;
  final String? location;

  Place({
    required this.id,
    this.url,
    this.status,
    this.isFavorite,
    this.isLite,
    this.isClassic,
    this.isAmex,
    this.hasDelivery,
    this.imageUrl,
    this.logoUrl,
    this.name,
    this.shortName,
    this.categories,
    this.schedule,
    this.score,
    this.priceRange,
    this.location,
  });

  factory Place.fromMap(Map<String, dynamic> json) => Place(
        id: json["id"],
        url: json["url"],
        status: json["status"],
        isFavorite: json["is_favorite"],
        isLite: json["is_lite"],
        isClassic: json["is_classic"],
        isAmex: json["is_amex"],
        hasDelivery: json["has_delivery"],
        imageUrl: json["image_url"],
        logoUrl: json["logo_url"],
        name: json["name"],
        shortName: json["shortName"],
        categories: json["categories"],
        schedule: json["schedule"],
        score: json["score"]?.toDouble(),
        priceRange: json["price_range"],
        location: json["location"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "url": url,
        "status": status,
        "is_favorite": isFavorite,
        "is_lite": isLite,
        "is_classic": isClassic,
        "is_amex": isAmex,
        "has_delivery": hasDelivery,
        "image_url": imageUrl,
        "logo_url": logoUrl,
        "name": name,
        "shortName": shortName,
        "categories": categories,
        "schedule": schedule,
        "score": score,
        "price_range": priceRange,
        "location": location,
      };
}
