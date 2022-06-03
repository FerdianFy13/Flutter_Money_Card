import 'package:flutter/material.dart';
import 'package:flutter_application/Pertemuan%205/models/Transaction.dart';

class ListTransactionWidget extends StatelessWidget {
  final List<Transaction> listTransaction;
  final Function removeTransaction;

  ListTransactionWidget(this.listTransaction, this.removeTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
      width: double.infinity,
      alignment: Alignment.center,
      // color: Colors.blue,
      height: 600,
      child: listTransaction.length <= 0
          ? Column(
              children: [
                Text(
                  'No Transaction',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 200,
                  child: Image.asset(
                    'assets/image/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: listTransaction.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  shadowColor: Colors.pink.shade100,
                  // color: Colors.blue,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            // color: Colors.purple,
                            // width: 7,
                          ),
                          color: Theme.of(context).colorScheme.primary,
                          // color: Colors.purple,
                          // shape: BoxShape.circle,
                        ),
                        child: Text(
                          listTransaction[index].price.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listTransaction[index].item,
                                style: Theme.of(context).textTheme.headline6,
                                // style: TextStyle(
                                //   fontSize: 18,
                                //   fontWeight: FontWeight.bold,
                                // ),
                              ),
                              Text(
                                listTransaction[index].date.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete_rounded),
                            onPressed: () {
                              removeTransaction(listTransaction[index].id);
                            },
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
