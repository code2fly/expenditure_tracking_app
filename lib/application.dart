import 'package:flutter/material.dart';
import 'package:expenditure_tracking_app/routes.dart';

class Application extends StatelessWidget {
  const Application({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello Flutter",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // home: HomePage(),
      initialRoute: '/',
      routes: routes,
    );
  }
}
