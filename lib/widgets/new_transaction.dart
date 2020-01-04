import 'package:flutter/material.dart';
import '../models/transaction.dart';
class NewTransaction extends StatelessWidget {

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransaction;
  NewTransaction(this.addTransaction);
  @override
  Widget build(BuildContext context) {
    return  Card(
              elevation: 20,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(        
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                      controller:  titleController,
                      
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(labelText: 'Amount'),
                     controller:  amountController,
                    ),
                    FlatButton(
                      child: Text('Add Transaction'),
                      textColor: Colors.purple,
                      onPressed: () {
                        final transaction = Transaction(amount:double.parse(amountController.text),
                        date: DateTime.now(),
                        id: DateTime.now().toString(),
                        title: titleController.text
                        );
                        addTransaction(transaction);                    
                       
                      },
                    ),
                    
                  ],
                ),
              ),
            );
  }
}