import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  var amount = '1,230.00';

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
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _TotalBudget(amount: amount),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(
                  flex: 2,
                ),
                Text(
                  'first item',
                  style: TextStyle(
                    backgroundColor: Colors.green,
                    fontSize: 20,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  'second item',
                  style: TextStyle(
                    backgroundColor: Colors.green,
                    fontSize: 20,
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class _TotalBudget extends StatelessWidget {
  const _TotalBudget({
    Key key,
    @required this.amount,
  }) : super(key: key);

  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      margin: EdgeInsets.all(10),
      child: Text(
        '\$$amount',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.green,
          gradient: LinearGradient(
            colors: [
              Colors.green,
              Colors.greenAccent,
            ],
            stops: [0.85, 1.0],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(4, 4),
            )
          ]),
    );
  }
}
