import 'package:flutter/material.dart';

class TypePage extends StatelessWidget {
  const TypePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Type'),
      ),
      body: Center(
        child: const Text('This is Type page'),
      ),
    );
  }
}
