import 'package:dio/dio.dart';

import '../models/city_model.dart';
import '../models/uf_model.dart';

class CityService {
  CityService(this._dio);

  final Dio _dio;

  Future<List<CityModel>> fetchCitiesFromUf(UfModel uf) async {
    final String ufInitials = uf.sigla;
    final Response response = await _dio
        .get('/localidades/estados/$ufInitials/municipios?orderBy=nome');
    final List cityMapList = response.data as List;
    final List<CityModel> cityList =
        cityMapList.map((cityMap) => CityModel.fromMap(cityMap)).toList();
    return cityList;
  }
}
