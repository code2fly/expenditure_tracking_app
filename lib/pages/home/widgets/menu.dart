import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: const Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: const Text('Accounts'),
            onTap: () => Navigator.of(context).pushNamed('/accounts'),
          ),
          ListTile(
            leading: Icon(Icons.access_alarm),
            title: const Text('Items'),
            onTap: () => Navigator.of(context).pushNamed('/items'),
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: const Text('Types'),
            onTap: () => Navigator.of(context).pushNamed('/types'),
          ),
        ],
      ),
    );
  }
}
