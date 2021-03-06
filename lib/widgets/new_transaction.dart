import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
//Fix bi cleared chu khi nhan vao text field khhac
//Chuyen state less ve state full widget

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction){
    print('Constructor run');
  }

  @override
  _NewTransactionState createState() => _NewTransactionState();
}


class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  @override
  void initState() {
    
    print('init state Run');// TODO: implement initState
    super.initState();
  }
  @override
  void didUpdateWidget(NewTransaction oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
   
  }
  final amountController = TextEditingController();
  DateTime dateTransaction;
  void _submitData(String _) {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || dateTransaction == null) {
      return;
    }
    final transaction = Transaction(
        amount: enteredAmount,
        date: dateTransaction,
        id: DateTime.now().toString(),
        title: enteredTitle);
    widget.addTransaction(transaction);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
        initialDate: DateTime.now(),
        lastDate: DateTime.now(),
        context: context,
        firstDate: DateTime.now().subtract(
          Duration(days: 20),
        )).then((date) {
      setState(() {
        dateTransaction = date;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
   
  }
  @override
  Widget build(BuildContext context) {
   
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          elevation: 100,
          child: Container(
            height: constraints.maxHeight * 1,
            padding: EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Platform.isIOS
                    ? CupertinoTextField(
                        placeholder: 'Title',
                        textAlign: TextAlign.center,
                        controller: titleController,
                      )
                    : TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          labelText: 'Title',
                        ),
                        controller: titleController,
                      ),
                SizedBox(
                  height: 1,
                ),
                Platform.isIOS
                    ? CupertinoTextField(
                        placeholder: 'Amount',
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: amountController,
                        onSubmitted: _submitData,
                      )
                    : TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Amount'),
                        controller: amountController,
                        onSubmitted: _submitData,
                      ),
                Container(
                  height: constraints.maxHeight * 0.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(dateTransaction == null
                          ? 'No Date chosen!!'
                          : DateFormat('dd-MM-yyy')
                              .format(dateTransaction)
                              .toString()),
                      //Date time picker presentation
                      FlatButton(
                              color: Colors.blue,
                              //textColor: Colors.purple,
                              child: Text('Choose date',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              onPressed: _presentDatePicker,
                            ),
                    ],
                  ),
                ),
                //Button to submit data
                Platform.isIOS ? Container(
                        width: constraints.maxWidth * 0.5,
                        child: FittedBox(
                          child: CupertinoButton(
                            onPressed: () {
                              _submitData('');
                            },
                            child: Text('Add Transaction'),
                            color: CupertinoColors.systemPurple,
                          ),
                        ),
                      )
                    : RaisedButton(
                        color: Colors.purple,
                        child: Text('Add Transaction',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          _submitData("");
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
