import 'package:flutter/material.dart';

class TypesPage extends StatelessWidget {
  const TypesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Types'),
      ),
      body: Center(
        child: const Text('This is types page'),
      ),
    );
  }
}
