import 'package:dio/dio.dart';

import '../dtos/places_filter_dto.dart';
import '../models/place_detail.dart';
import '../responses/places_filter_response.dart';

abstract class HomeRepository {
  Future<PlaceFilterResponse> getPlacesByFilter(PlacesFilterDto data);
  Future<PlaceDetail?> getPlaceById(int id);
}

class HomeRepositoryImpl extends HomeRepository {
  final Dio _dio;

  HomeRepositoryImpl(this._dio);

  @override
  Future<PlaceFilterResponse> getPlacesByFilter(PlacesFilterDto data) async {
    try {
      final response = await _dio.get(
        '/api/places/getPlacesByFilter',
        queryParameters: data.toMap(),
      );
      return PlaceFilterResponse.fromMap(response.data);
    } catch (e) {
      if (e is DioException) {
        return PlaceFilterResponse(
            message: e.response?.data["message"] ?? "Server error");
      }
      return PlaceFilterResponse(message: e.toString());
    }
  }

  @override
  Future<PlaceDetail?> getPlaceById(int id) async {
    try {
      final response = await _dio.get(
        '/api/places/getPlaceById/$id',
      );
      return PlaceDetail.fromMap(response.data["data"]);
    } catch (e) {
      return null;
    }
  }
}
