import 'package:flutter/material.dart';
import 'package:flutter_application/Pertemuan%205/models/Transaction.dart';
import 'package:flutter_application/Pertemuan%205/widgets/chartWidget.dart';
import 'package:flutter_application/Pertemuan%205/widgets/insertTransactionWidget.dart';
import 'package:flutter_application/Pertemuan%205/widgets/listTransactionWidget.dart';
// ignore: unused_import
import 'package:flutter_application/Pertemuan%205/widgets/userTransactionWidget.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.red,
        ),
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void modelInsertTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) => InsertTransactionWidget(insertTransaction),
    );
  }

  final List<Transaction> listTransaction = [
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
      price: 15.99,
      date: DateTime.now(),
    ),
  ];

  void insertTransaction(String item, double price, DateTime selectedDates) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      item: item,
      price: price,
      date: selectedDates,
    );

    setState(
      () {
        listTransaction.add(newTransaction);
      },
    );
  }

  void removeTransaction(String id) {
    setState(() {
      listTransaction.removeWhere((data) => data.id == id);
    });
  }

  List<Transaction> get _transactionLast {
    return listTransaction.where(
      (tx) {
        return tx.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text('Flutter Testing'),
        // backgroundColor: Theme.of(context).primaryColor,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () => modelInsertTransaction(context),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Container(
              //   margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
              //   width: double.infinity,
              //   alignment: Alignment.center,
              //   color: Colors.blue,
              //   child: Card(
              //     color: Colors.blue,
              //     child: Text(
              //       'Card One',
              //       style: TextStyle(color: Colors.white),
              //     ),
              //   ),
              // ),
              ChartWidget(_transactionLast),
              ListTransactionWidget(listTransaction, removeTransaction),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => modelInsertTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
