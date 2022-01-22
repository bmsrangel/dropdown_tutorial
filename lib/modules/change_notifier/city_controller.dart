import 'package:flutter/material.dart';

import '../../core/models/city_model.dart';
import '../../core/models/uf_model.dart';
import '../../core/services/city_service.dart';

class CityController extends ChangeNotifier {
  CityController(this._service);

  final CityService _service;

  List<CityModel>? cityList;
  CityModel? selectedCity;

  void setSelectedCity(CityModel value) {
    selectedCity = value;
    notifyListeners();
  }

  Future<void> getCityListFromUf(UfModel value) async {
    cityList = await _service.fetchCitiesFromUf(value);
    notifyListeners();
  }
}
