class PlaceDetail {
  final int? id;
  final String? slug;
  final bool? isLite;
  final bool? isClassic;
  final bool? isFavorite;
  final bool? isAmex;
  final bool? hasDelivery;
  final int? reservable;
  final List<Reservation>? reservations;
  final String? name;
  final String? description;
  final String? mainImg;
  final String? logoImg;
  final List<Gallery>? gallery;
  final String? rangePrice;
  final bool? status;
  final List<Schedule>? schedules;
  final List<Category>? categories;
  final List<Amenity>? amenities;
  final dynamic dressCode;
  final Reviews? reviews;
  final Geolocation? geolocation;
  final List<CloserPlace>? closerPlaces;
  final Schema? schema;

  PlaceDetail({
    this.id,
    this.slug,
    this.isLite,
    this.isClassic,
    this.isFavorite,
    this.isAmex,
    this.hasDelivery,
    this.reservable,
    this.reservations,
    this.name,
    this.description,
    this.mainImg,
    this.logoImg,
    this.gallery,
    this.rangePrice,
    this.status,
    this.schedules,
    this.categories,
    this.amenities,
    this.dressCode,
    this.reviews,
    this.geolocation,
    this.closerPlaces,
    this.schema,
  });

  factory PlaceDetail.fromMap(Map<String, dynamic> json) => PlaceDetail(
        id: json["id"],
        slug: json["slug"],
        isLite: json["is_lite"],
        isClassic: json["is_classic"],
        isFavorite: json["is_favorite"],
        isAmex: json["is_amex"],
        hasDelivery: json["has_delivery"],
        reservable: json["reservable"],
        reservations: json["reservations"] == null
            ? []
            : List<Reservation>.from(
                json["reservations"]!.map((x) => Reservation.fromMap(x))),
        name: json["name"],
        description: json["description"],
        mainImg: json["main_img"],
        logoImg: json["logo_img"],
        gallery: json["gallery"] == null
            ? []
            : List<Gallery>.from(
                json["gallery"]!.map((x) => Gallery.fromMap(x))),
        rangePrice: json["range_price"],
        status: json["status"],
        schedules: json["schedules"] == null
            ? []
            : List<Schedule>.from(
                json["schedules"]!.map((x) => Schedule.fromMap(x))),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromMap(x))),
        amenities: json["amenities"] == null
            ? []
            : List<Amenity>.from(
                json["amenities"]!.map((x) => Amenity.fromMap(x))),
        dressCode: json["dress_code"],
        reviews:
            json["reviews"] == null ? null : Reviews.fromMap(json["reviews"]),
        geolocation: json["geolocation"] == null
            ? null
            : Geolocation.fromMap(json["geolocation"]),
        closerPlaces: json["closer_places"] == null
            ? []
            : List<CloserPlace>.from(
                json["closer_places"]!.map((x) => CloserPlace.fromMap(x))),
        schema: json["schema"] == null ? null : Schema.fromMap(json["schema"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "slug": slug,
        "is_lite": isLite,
        "is_classic": isClassic,
        "is_favorite": isFavorite,
        "is_amex": isAmex,
        "has_delivery": hasDelivery,
        "reservable": reservable,
        "reservations": reservations == null
            ? []
            : List<dynamic>.from(reservations!.map((x) => x.toMap())),
        "name": name,
        "description": description,
        "main_img": mainImg,
        "logo_img": logoImg,
        "gallery": gallery == null
            ? []
            : List<dynamic>.from(gallery!.map((x) => x.toMap())),
        "range_price": rangePrice,
        "status": status,
        "schedules": schedules == null
            ? []
            : List<dynamic>.from(schedules!.map((x) => x.toMap())),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toMap())),
        "amenities": amenities == null
            ? []
            : List<dynamic>.from(amenities!.map((x) => x.toMap())),
        "dress_code": dressCode,
        "reviews": reviews?.toMap(),
        "geolocation": geolocation?.toMap(),
        "closer_places": closerPlaces == null
            ? []
            : List<dynamic>.from(closerPlaces!.map((x) => x.toMap())),
        "schema": schema?.toMap(),
      };
}

class Amenity {
  final int? id;
  final String? name;
  final String? icon;

  Amenity({
    this.id,
    this.name,
    this.icon,
  });

  factory Amenity.fromMap(Map<String, dynamic> json) => Amenity(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "icon": icon,
      };
}

class Category {
  final int? id;
  final String? url;
  final String? imgUrl;
  final String? name;

  Category({
    this.id,
    this.url,
    this.imgUrl,
    this.name,
  });

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        url: json["url"],
        imgUrl: json["img_url"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "url": url,
        "img_url": imgUrl,
        "name": name,
      };
}

class CloserPlace {
  final int? id;
  final String? name;
  final String? url;
  final String? imgUrl;
  final String? address;
  final String? score;
  final double? distance;

  CloserPlace({
    this.id,
    this.name,
    this.url,
    this.imgUrl,
    this.address,
    this.score,
    this.distance,
  });

  factory CloserPlace.fromMap(Map<String, dynamic> json) => CloserPlace(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        imgUrl: json["img_url"],
        address: json["address"],
        score: json["score"],
        distance: json["distance"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "url": url,
        "img_url": imgUrl,
        "address": address,
        "score": score,
        "distance": distance,
      };
}

class Gallery {
  final int? id;
  final String? file;

  Gallery({
    this.id,
    this.file,
  });

  factory Gallery.fromMap(Map<String, dynamic> json) => Gallery(
        id: json["id"],
        file: json["file"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "file": file,
      };
}

class Geolocation {
  final String? textDirection;
  final String? latitude;
  final String? longitude;

  Geolocation({
    this.textDirection,
    this.latitude,
    this.longitude,
  });

  factory Geolocation.fromMap(Map<String, dynamic> json) => Geolocation(
        textDirection: json["text_direction"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toMap() => {
        "text_direction": textDirection,
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Reservation {
  final DateTime? date;
  final Data? data;

  Reservation({
    this.date,
    this.data,
  });

  factory Reservation.fromMap(Map<String, dynamic> json) => Reservation(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "data": data?.toMap(),
      };
}

class Data {
  final int? maxPeople;
  final List<String>? hours;
  final List<Area>? areas;

  Data({
    this.maxPeople,
    this.hours,
    this.areas,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        maxPeople: json["max_people"],
        hours: json["hours"] == null
            ? []
            : List<String>.from(json["hours"]!.map((x) => x)),
        areas: json["areas"] == null
            ? []
            : List<Area>.from(json["areas"]!.map((x) => Area.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "max_people": maxPeople,
        "hours": hours == null ? [] : List<dynamic>.from(hours!.map((x) => x)),
        "areas": areas == null
            ? []
            : List<dynamic>.from(areas!.map((x) => x.toMap())),
      };
}

class Area {
  final String? name;
  final bool? value;
  final bool? selected;

  Area({
    this.name,
    this.value,
    this.selected,
  });

  factory Area.fromMap(Map<String, dynamic> json) => Area(
        name: json["name"],
        value: json["value"],
        selected: json["selected"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "value": value,
        "selected": selected,
      };
}

class Reviews {
  final String? totalScore;
  final int? quantity;
  final List<int>? stars;
  final List<dynamic>? data;
  final bool? viewMore;

  Reviews({
    this.totalScore,
    this.quantity,
    this.stars,
    this.data,
    this.viewMore,
  });

  factory Reviews.fromMap(Map<String, dynamic> json) => Reviews(
        totalScore: json["totalScore"],
        quantity: json["quantity"],
        stars: json["stars"] == null
            ? []
            : List<int>.from(json["stars"]!.map((x) => x)),
        data: json["data"] == null
            ? []
            : List<dynamic>.from(json["data"]!.map((x) => x)),
        viewMore: json["view_more"],
      );

  Map<String, dynamic> toMap() => {
        "totalScore": totalScore,
        "quantity": quantity,
        "stars": stars == null ? [] : List<dynamic>.from(stars!.map((x) => x)),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        "view_more": viewMore,
      };
}

class Schedule {
  final String? weekday;
  final String? start;
  final String? end;

  Schedule({
    this.weekday,
    this.start,
    this.end,
  });

  factory Schedule.fromMap(Map<String, dynamic> json) => Schedule(
        weekday: json["weekday"],
        start: json["start"],
        end: json["end"],
      );

  Map<String, dynamic> toMap() => {
        "weekday": weekday,
        "start": start,
        "end": end,
      };
}

class Schema {
  final String? context;
  final String? type;
  final String? name;
  final String? image;
  final String? description;
  final Address? address;
  final String? telephone;
  final String? priceRange;
  final String? url;
  final AggregateRating? aggregateRating;

  Schema({
    this.context,
    this.type,
    this.name,
    this.image,
    this.description,
    this.address,
    this.telephone,
    this.priceRange,
    this.url,
    this.aggregateRating,
  });

  factory Schema.fromMap(Map<String, dynamic> json) => Schema(
        context: json["@context"],
        type: json["@type"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        address:
            json["address"] == null ? null : Address.fromMap(json["address"]),
        telephone: json["telephone"],
        priceRange: json["priceRange"],
        url: json["url"],
        aggregateRating: json["aggregateRating"] == null
            ? null
            : AggregateRating.fromMap(json["aggregateRating"]),
      );

  Map<String, dynamic> toMap() => {
        "@context": context,
        "@type": type,
        "name": name,
        "image": image,
        "description": description,
        "address": address?.toMap(),
        "telephone": telephone,
        "priceRange": priceRange,
        "url": url,
        "aggregateRating": aggregateRating?.toMap(),
      };
}

class Address {
  final String? type;
  final String? streetAddress;
  final String? addressLocality;
  final String? addressRegion;
  final String? addressCountry;

  Address({
    this.type,
    this.streetAddress,
    this.addressLocality,
    this.addressRegion,
    this.addressCountry,
  });

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        type: json["@type"],
        streetAddress: json["streetAddress"],
        addressLocality: json["addressLocality"],
        addressRegion: json["addressRegion"],
        addressCountry: json["addressCountry"],
      );

  Map<String, dynamic> toMap() => {
        "@type": type,
        "streetAddress": streetAddress,
        "addressLocality": addressLocality,
        "addressRegion": addressRegion,
        "addressCountry": addressCountry,
      };
}

class AggregateRating {
  final String? ratingValue;
  final double? reviewCount;

  AggregateRating({
    this.ratingValue,
    this.reviewCount,
  });

  factory AggregateRating.fromMap(Map<String, dynamic> json) => AggregateRating(
        ratingValue: json["ratingValue"],
        reviewCount: json["reviewCount"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "ratingValue": ratingValue,
        "reviewCount": reviewCount,
      };
}
