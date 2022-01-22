import 'package:dio/dio.dart';

import '../models/uf_model.dart';

class UfService {
  UfService(this._dio);

  final Dio _dio;

  Future<List<UfModel>> fetchAllUfs() async {
    final Response response =
        await _dio.get('/localidades/estados?orderBy=nome');
    final List ufMapList = response.data as List;
    final List<UfModel> ufList =
        ufMapList.map((ufMap) => UfModel.fromMap(ufMap)).toList();
    return ufList;
  }
}
