class PlacesFilterDto {
  final String mode;
  final int page;

  PlacesFilterDto({
    required this.mode,
    required this.page,
  });

  factory PlacesFilterDto.fromMap(Map<String, dynamic> json) => PlacesFilterDto(
        mode: json["mode"],
        page: json["page"],
      );

  Map<String, dynamic> toMap() => {
        "mode": mode,
        "page": page,
      };
}
