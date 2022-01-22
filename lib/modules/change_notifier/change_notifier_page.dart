import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../core/models/city_model.dart';
import '../../core/models/uf_model.dart';
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

    ufController.getUfList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              AnimatedBuilder(
                  animation: ufController,
                  builder: (_, __) {
                    if (ufController.ufList != null) {
                      return Flexible(
                        flex: 1,
                        child: DropdownButton<UfModel>(
                          hint: const Text('UF'),
                          value: ufController.selectedUf,
                          items: ufController.ufList!
                              .map((e) => DropdownMenuItem(
                                    child: Text(e.sigla),
                                    value: e,
                                  ))
                              .toList(),
                          onChanged: (value) {
                            ufController.setSelectedUf(value!);
                            cityController.getCityListFromUf(value);
                          },
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
              const SizedBox(width: 20.0),
              AnimatedBuilder(
                  animation: cityController,
                  builder: (_, __) {
                    if (ufController.selectedUf == null) {
                      return Flexible(
                        flex: 2,
                        child: DropdownButton<void>(
                          hint: const Text('Cidade'),
                          items: const [],
                          onChanged: (value) => {},
                          isExpanded: true,
                        ),
                      );
                    } else {
                      if (cityController.cityList == null) {
                        return const CircularProgressIndicator();
                      } else {
                        return Expanded(
                          flex: 2,
                          child: DropdownButton<CityModel>(
                            value: cityController.selectedCity,
                            isExpanded: true,
                            hint: const Text('Cidade'),
                            items: cityController.cityList!
                                .map((e) => DropdownMenuItem(
                                      child: Text(e.nome),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (value) =>
                                cityController.setSelectedCity(value!),
                          ),
                        );
                      }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
