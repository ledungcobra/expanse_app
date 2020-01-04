import 'package:intl/intl.dart';
import './widgets/transaction_list.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Expense application",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  

  final titleController = TextEditingController();
  final amountController  = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Text("chart here"),
            ),
            Card(
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
                       print(titleController.text);
                      },
                    ),
                    TransactionList()
                  ],
                ),
              ),
            ),
          
          ],
        )
        );
  }
}
