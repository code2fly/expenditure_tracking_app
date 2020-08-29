import 'package:expenditure_tracking_app/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';

class Application extends StatelessWidget {
  const Application({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "Hello Flutter",
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: CupertinoColors.white,
        barBackgroundColor: CupertinoColors.activeBlue,
        primaryColor: Color.fromRGBO(232, 232, 232, 1),
      ),
      home: HomePage(),
    );
  }
}
