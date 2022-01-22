import 'package:flutter/material.dart';

import '../../core/services/uf_service.dart';

class UfController extends ChangeNotifier {
  UfController(this._service);

  final UfService _service;
}
