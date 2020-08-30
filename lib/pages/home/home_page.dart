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
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Spacer(
            flex: 1,
          ),
          _TotalBudget(amount: amount),
          Spacer(
            flex: 20,
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            // color: Colors.grey,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _BarLine(
                  color: Colors.red,
                  height: 200,
                  textLabel: 'Withdraw',
                  amount: 200,
                ),
                _BarLine(
                  color: Colors.green,
                  height: 500,
                  textLabel: 'Deposit',
                  amount: 500,
                ),
              ],
            ),
          ),
          Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}

// ideally this should be done with charts provided by flutter instead of coloring containers
class _BarLine extends StatelessWidget {
  final double height;
  final Color color;
  final String textLabel;
  final double amount;
  const _BarLine({
    Key key,
    this.height,
    this.color,
    this.textLabel,
    this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.center,
        height: height,
        width: 80,
        color: color,
      ),
      Text(
        '$textLabel',
        style: TextStyle(
            // fontSize: 20,
            ),
      ),
      Text(
        '\$$amount',
        style: TextStyle(
            // fontSize: 20,
            ),
      ),
    ]);
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
