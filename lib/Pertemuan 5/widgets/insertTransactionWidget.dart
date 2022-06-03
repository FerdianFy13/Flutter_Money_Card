import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InsertTransactionWidget extends StatefulWidget {
  final Function insertTransaction;

  InsertTransactionWidget(this.insertTransaction);

  @override
  _InsertTransactionWidgetState createState() =>
      _InsertTransactionWidgetState();
}

class _InsertTransactionWidgetState extends State<InsertTransactionWidget> {
  final nameTransaction = TextEditingController();
  final priceTransaction = TextEditingController();
  DateTime selectedDates;

  void submitHandler() {
    final inputItem = nameTransaction.text;
    final inputPrice = double.parse(priceTransaction.text);

    if (inputItem.isEmpty || inputPrice < 0 || selectedDates == null) {
      return;
    }
    widget.insertTransaction(inputItem, inputPrice, selectedDates);
    Navigator.of(context).pop();
  }

  void selectedDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        } else {
          setState(() {
            selectedDates = pickedDate;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Name Transaction"),
                  controller: nameTransaction,
                  keyboardType: TextInputType.emailAddress,
                  onSubmitted: (_) => submitHandler(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Price Transaction"),
                  controller: priceTransaction,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitHandler(),
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                        child: selectedDates == null
                            ? Text('Date Not Selected')
                            : Text(
                                'Date Selected: ${DateFormat.yMd().format(selectedDates)}'),
                      ),
                      TextButton(
                        onPressed: selectedDate,
                        child: Text(
                          'Date Selected',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    return widget.insertTransaction(
                      nameTransaction.text,
                      double.parse(priceTransaction.text),
                    );
                  },
                  child: Text(
                    "Insert",
                    style: TextStyle(
                      color: Colors.purple,
                      // fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
