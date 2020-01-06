import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
//Fix bi cleared chu khi nhan vao text field khhac
//Chuyen state less ve state full widget

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime dateTransaction;
  void _submitData(String _) {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 ||dateTransaction == null) {
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
    showDatePicker(initialDate: DateTime.now(),
            lastDate: DateTime.now(),
        context: context,
        firstDate: DateTime.now().subtract(
          Duration(days: 20),
        )).then(
          (date){
            setState(() {
               dateTransaction = date;
            });
         
        });
  }

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(builder: (context,constraints){
      return Card(      
      elevation: 100,
      child: Container(   
        height: constraints.maxHeight*1,

        padding: EdgeInsets.only(top:0,right: 10,left: 10,bottom:10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
            ),
            SizedBox(
              height: 1,
            ),
            TextField(
              
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: _submitData,
            ),
            Container(
              height: constraints.maxHeight*0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(dateTransaction == null?'No Date chosen!!': DateFormat('dd-MM-yyy').format(dateTransaction).toString()),
                  //Date time picker presentation
                  FlatButton(
                    textColor: Colors.purple,
                    child: Text('Choose date',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: _presentDatePicker,
                  )
                ],
              ),
            ),
            //Button to submit data
            RaisedButton(
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
    },);
  }
}
