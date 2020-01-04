
import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatefulWidget {
 

 
 _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: "t1",
        amount: 99.99,
        date: DateTime.now(),
        title: "Nothing special"),
    Transaction(
        id: "t2", amount: 20, date: DateTime.now(), title: "Buy cheap food"),
    Transaction(
        id: "t3", amount: 100.3, date: DateTime.now(), title: "Buy shoes"),
    Transaction(
        id: "t4", amount: 2403.5, date: DateTime.now(), title: "Buy cookies ")
  
  ];
  @override
  Widget build(BuildContext context) {
    return  Container(
              width: double.infinity,
              child: Column(
                children: _userTransactions.map((tx) {
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Card(
                            child: Text(
                              "\$ ${tx.amount.toString()}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              tx.title,
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
                                  .format(tx.date)
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
                }).toList(),
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            );
  }
}