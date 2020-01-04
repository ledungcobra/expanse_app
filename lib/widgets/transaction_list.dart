import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.purple,
                          width: 5,
                          style: BorderStyle.solid)),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Card(
                    child: Text(
                      "\$ ${transactions[index].amount.toString()}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      DateFormat('dd/MM/yyyy     hh:mm:ss ')
                          .format(transactions[index].date)
                          .toString(),
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                )
              ],
            ),
            elevation: 50,
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
