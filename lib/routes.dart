import 'package:expenditure_tracking_app/pages/index.dart';
import 'package:flutter/material.dart';

final routes = {
  '/': (BuildContext context) => HomePage(),
  '/accounts': (BuildContext context) => AccountsPage(),
  '/items': (BuildContext context) => ItemsPage(),
  '/types': (BuildContext context) => TypesPage(),
};
