import 'package:flutter/material.dart';

import '../../core/models/uf_model.dart';
import '../../core/services/uf_service.dart';

class UfController extends ChangeNotifier {
  UfController(this._service);

  final UfService _service;

  List<UfModel>? ufList;
  UfModel? selectedUf;

  void setSelectedUf(UfModel value) {
    selectedUf = value;
    notifyListeners();
  }

  Future<void> getUfList() async {
    ufList = await _service.fetchAllUfs();
    notifyListeners();
  }
}
