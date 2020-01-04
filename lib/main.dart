
import './widgets/user_transaction.dart';
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
        body: SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                child: Text("chart here"),
              ),
              UserTransaction()
       
            
            ],
          ),
        )
        );
  }
}
