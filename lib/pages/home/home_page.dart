import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => print('click add'),
            tooltip: 'add',
          ),
          IconButton(
            icon: Icon(Icons.update),
            onPressed: () => print('click update'),
            tooltip: 'update',
          )
        ],
      ),
      body: Center(
        child: Text('My First Page'),
      ),
    );
  }
}
