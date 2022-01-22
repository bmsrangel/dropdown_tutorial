import 'package:flutter/material.dart';

import '../../core/services/city_service.dart';

class CityController extends ChangeNotifier {
  CityController(this._service);

  final CityService _service;
}
