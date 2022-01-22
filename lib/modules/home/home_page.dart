import 'package:flutter/material.dart';

import '../change_notifier/change_notifier_page.dart';
import '../example/example_page.dart';
import '../set_state/set_state_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Exemplo'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ExamplePage(),
              ),
            ),
          ),
          ListTile(
            title: const Text('SetState'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SetStatePage(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Change Notifier'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ChangeNotifierPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
