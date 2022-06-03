import 'package:flutter/material.dart';
import 'package:flutter_application/Pertemuan%205/models/Transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePages(),
    );
  }
}

// ignore: must_be_immutable
class MyHomePages extends StatelessWidget {
  MyHomePages({Key key}) : super(key: key);
  var listTransactions = [
    Transaction(
      id: 't1',
      item: 'Shoes',
      price: 12.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      item: 'T-Shirt',
      price: 19.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      item: 'Jeans',
      price: 59.99,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text('Financial Records'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.blue,
              child: Card(
                color: Colors.blue,
                child: Text(
                  'Card One',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
              width: double.infinity,
              alignment: Alignment.center,
              // color: Colors.blue,
              child: Column(
                children: [
                  ...listTransactions.map(
                    (transaction) => Card(
                      elevation: 10,
                      shadowColor: Colors.blue.shade200,
                      // color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                    decoration: ShapeDecoration(
                                      shape: CircleBorder(),
                                      color: Colors.purple,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(8, 23, 0, 0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      transaction.price.toString(),
                                      style: TextStyle(
                                        // fontSize: 20,
                                        color: Colors.white,
                                      ),
                                      // textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(transaction.item),
                              Text(
                                transaction.date.toString(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.delete_rounded,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
