import 'package:flutter/material.dart';
import 'package:flutter_application/Pertemuan%205/models/Transaction.dart';
import 'package:flutter_application/Pertemuan%205/widgets/insertTransactionWidget.dart';
import 'package:flutter_application/Pertemuan%205/widgets/listTransactionWidget.dart';

class UserTransactionWidget extends StatefulWidget {
  const UserTransactionWidget({Key key}) : super(key: key);

  @override
  State<UserTransactionWidget> createState() => _UserTransactionWidgetState();
}

class _UserTransactionWidgetState extends State<UserTransactionWidget> {
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
      price: 59.99,
      date: DateTime.now(),
    ),
  ];

  void insertTransaction(String item, double price) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      item: item,
      price: price,
      date: DateTime.now(),
    );

    setState(() {
      listTransaction.add(newTransaction);
    });
  }

  void removeTransaction(String item, double price) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      item: item,
      price: price,
      date: DateTime.now(),
    );

    setState(() {
      listTransaction.remove(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InsertTransactionWidget(insertTransaction),
        ListTransactionWidget(listTransaction, removeTransaction),
      ],
    );
  }
}
