import 'package:flutter/cupertino.dart';

import 'data/dtos/places_filter_dto.dart';
import 'data/repositories/home_repository.dart';
import 'data/models/place.dart';
import 'data/models/place_detail.dart';
import 'data/responses/places_filter_response.dart';

class HomeController extends ChangeNotifier {
  final HomeRepository _homeRepository;
  bool loading = true;
  bool loadingDetail = true;
  bool loadingMore = false;
  int page = 0;
  bool showMore = true;
  List<Place> places = [];
  PlaceFilterResponse? placeResponse;
  PlaceDetail? placeDetail;

  HomeController(this._homeRepository) {
    getPlaces();
  }

  void getPlaces() async {
    if (showMore) {
      if (page > 0) {
        loadingMore = true;
        notifyListeners();
      }
      placeResponse = await _homeRepository.getPlacesByFilter(
        PlacesFilterDto(
          mode: "phone",
          page: page,
        ),
      );
      places = [...places, ...placeResponse?.data ?? []];
      loading = false;
      loadingMore = false;
      showMore = placeResponse?.showMore ?? false;
      page++;
      notifyListeners();
    }
  }

  void getPlaceDetail(int id) async {
    placeDetail = null;
    loadingDetail = true;
    notifyListeners();
    placeDetail = await _homeRepository.getPlaceById(id);
    loadingDetail = false;
    notifyListeners();
  }
}
