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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              FutureBuilder<List<UfModel>>(
                future: ufService.fetchAllUfs(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<UfModel> data = snapshot.data!;
                    return Flexible(
                      flex: 1,
                      child: DropdownButton<UfModel>(
                        hint: const Text('UF'),
                        value: selectedUf,
                        items: data
                            .map((e) => DropdownMenuItem(
                                  child: Text(e.sigla),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedUf = value;
                          });
                        },
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              const SizedBox(width: 20.0),
              selectedUf == null
                  ? Flexible(
                      flex: 2,
                      child: DropdownButton<void>(
                        hint: const Text('Cidade'),
                        items: const [],
                        onChanged: (value) => {},
                        isExpanded: true,
                      ),
                    )
                  : FutureBuilder<List<CityModel>>(
                      future: cityService.fetchCitiesFromUf(selectedUf!),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const CircularProgressIndicator();
                        } else {
                          final List<CityModel> data = snapshot.data!;
                          return Expanded(
                            flex: 2,
                            child: DropdownButton<CityModel>(
                              value: selectedCity,
                              isExpanded: true,
                              hint: const Text('Cidade'),
                              items: data
                                  .map((e) => DropdownMenuItem(
                                        child: Text(e.nome),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (value) => setState(
                                () {
                                  selectedCity = value;
                                },
                              ),
                            ),
                          );
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
