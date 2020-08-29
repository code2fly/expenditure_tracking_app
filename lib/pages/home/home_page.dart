import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        // backgroundColor: CupertinoTheme.of(context).primaryColor,
        leading: Icon(CupertinoIcons.add),
        middle: Text('Home'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Oneee'),
            Text('Two'),
            Text('Threee'),
          ],
        ),
      ),
    );
  }
}
