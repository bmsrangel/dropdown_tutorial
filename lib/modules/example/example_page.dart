import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final List<String> genders = ['Masculino', 'Feminino'];
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo'),
      ),
      body: Center(
        child: DropdownButton<String>(
          items: [
            DropdownMenuItem(
              child: Text(genders[0]),
              value: genders[0],
            ),
            DropdownMenuItem(
              child: Text(genders[1]),
              value: genders[1],
            ),
          ],
          onChanged: (value) => setState(() {
            selectedGender = value;
          }),
          value: selectedGender,
          hint: const Text('Gênero'),
        ),
      ),
    );
  }
}
