import '../models/place.dart';

class PlaceFilterResponse {
  final int? status;
  final String? message;
  final String? page;
  final bool? showMore;
  final List<Place>? data;

  PlaceFilterResponse({
    this.status,
    this.message,
    this.page,
    this.showMore,
    this.data,
  });

  factory PlaceFilterResponse.fromMap(Map<String, dynamic> json) =>
      PlaceFilterResponse(
        status: json["status"],
        message: json["message"],
        page: json["page"],
        showMore: json["showMore"],
        data: json["data"] == null
            ? []
            : List<Place>.from(json["data"]!.map((x) => Place.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "page": page,
        "showMore": showMore,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}
