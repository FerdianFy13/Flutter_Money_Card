import 'package:flutter_application/Pertemuan%205/models/Transaction.dart';
import 'package:flutter_application/Pertemuan%205/widgets/chartBarWidget.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  final List<Transaction> lastTransaction;

  ChartWidget(this.lastTransaction);

  // ignore: non_constant_identifier_names
  List<Map<String, Object>> get GroupedTransactionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
        var totalSum = 0.0;

        for (var i = 0; i < lastTransaction.length; i++) {
          if (lastTransaction[i].date.day == weekDay.day &&
              lastTransaction[i].date.month == weekDay.month &&
              lastTransaction[i].date.year == weekDay.year) {
            totalSum += lastTransaction[i].price;
          }
        }

        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalSum,
        };
      },
    ).reversed.toList();
  }

  double get maxSpending => GroupedTransactionValues.fold(
        0.0,
        (sum, item) => sum + item['amount'],
      );

  @override
  Widget build(BuildContext context) {
    print(GroupedTransactionValues);
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...GroupedTransactionValues.map(
              (data) => Flexible(
                fit: FlexFit.tight,
                child: ChartBarWidget(
                    data['day'],
                    data['amount'],
                    maxSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / maxSpending),
              ),
            ).toList(),
          ],
        ),
      ),
    );
  }
}
