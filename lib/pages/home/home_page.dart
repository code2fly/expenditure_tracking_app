import 'package:flutter/material.dart';
import 'package:expenditure_tracking_app/pages/home/widgets/custom_text.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Oneee'),
            CustomText(
              text: 'TWOoooo',
            ),
            Text('Threee'),
            Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
              height: 400,
            ),
          ],
        ),
      ),
    );
  }
}
