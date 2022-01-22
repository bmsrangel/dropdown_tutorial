import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../core/services/city_service.dart';
import '../../core/services/uf_service.dart';
import 'city_controller.dart';
import 'uf_controller.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({Key? key}) : super(key: key);

  @override
  _ChangeNotifierPageState createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  late final Dio dio;
  late final UfService ufService;
  late final CityService cityService;

  late final UfController ufController;
  late final CityController cityController;

  @override
  void initState() {
    dio = Dio(BaseOptions(baseUrl: 'https://servicodados.ibge.gov.br/api/v1'));

    ufService = UfService(dio);
    cityService = CityService(dio);

    ufController = UfController(ufService);
    cityController = CityController(cityService);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier'),
      ),
      body: const Center(
        child: Text('Hello, Dropdown!'),
      ),
    );
  }
}
