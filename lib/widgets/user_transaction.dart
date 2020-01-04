
import '../models/transaction.dart';

import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {
  UserTransaction
({Key key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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
  
  ];
  void addTransaction(Transaction tx){
    setState((){
       _userTransactions.add(tx);

    });
   
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
             NewTransaction(addTransaction),   
            TransactionList(_userTransactions)

      ],
    );
  }
}