import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../core/models/city_model.dart';
import '../../core/models/uf_model.dart';
import '../../core/services/city_service.dart';
import '../../core/services/uf_service.dart';

class SetStatePage extends StatefulWidget {
  const SetStatePage({Key? key}) : super(key: key);

  @override
  _SetStatePageState createState() => _SetStatePageState();
}

class _SetStatePageState extends State<SetStatePage> {
  late final Dio dio;
  late final UfService ufService;
  late final CityService cityService;

  UfModel? selectedUf;
  CityModel? selectedCity;

  @override
  void initState() {
    dio = Dio(BaseOptions(baseUrl: 'https://servicodados.ibge.gov.br/api/v1'));
    ufService = UfService(dio);
    cityService = CityService(dio);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SetState'),
      ),
      body: const Center(
        child: Text('Hello, Dropdown!'),
      ),
    );
  }
}
