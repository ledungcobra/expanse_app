import 'dart:math';

import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  List<Widget> _buildListWidget(BoxConstraints constraints) {
    return [
      Container(
          height: constraints.maxHeight * 0.05,
          child: FittedBox(child: Text('No item add here'))),
      SizedBox(
        height: constraints.maxHeight * 0.05,
      ),
      Container(
        height: constraints.maxHeight * 0.9,
        child: Image.asset('assets/images/waiting.png', fit: BoxFit.contain),
      )
    ];
  }

  Color _backgroundColor;
  @override
  void initState() {
      super.initState();
    var colors = [Colors.red, Colors.amber, Colors.blue, Colors.green];
    
    setState(() {
       _backgroundColor = colors[Random(DateTime.now().second).nextInt(4)];
    });
   

    // TODO: implement initState
  
  }

  Widget _txItem(int index) {
    print(_backgroundColor.toString());
    return ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(3),
            child: FittedBox(
              child: Text(
                '\$${widget.transactions[index].amount.toStringAsFixed(2)}',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        title: Text(widget.transactions[index].title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        subtitle: Text(
          DateFormat('dd-MM-yyyy')
              .format(widget.transactions[index].date)
              .toString(),
          style: TextStyle(fontSize: 15, color: Colors.grey),
        ),
        trailing: FlatButton.icon(
          label: Text('Delete'),
          icon: Icon(Icons.delete),
          textColor: Theme.of(context).errorColor,
          onPressed: () {
            widget.deleteTransaction(widget.transactions[index].id);
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      height: mediaQuery.size.height / 1.5,
      child: widget.transactions.isEmpty
          ? LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: <Widget>[
                    ..._buildListWidget(constraints),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                );
              },
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Column(
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: _txItem(index),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                );
                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         decoration: BoxDecoration(
                //             border: Border.all(
                //                 color: Colors.purple,
                //                 width: 5,
                //                 style: BorderStyle.solid)),
                //         padding: EdgeInsets.all(10),
                //         margin:
                //             EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                //         child: Card(
                //           child: Text(
                //             "\$ ${widget.transactions[index].amount.toStringAsFixed(2)}",
                //             style: TextStyle(fontWeight: FontWeight.bold),
                //           ),
                //         ),
                //       ),
                //       Column(
                //         children: <Widget>[
                //           Text(
                //             widget.transactions[index].title,
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               fontSize: 20,
                //             ),
                //           ),
                //           SizedBox(
                //             height: 10,
                //           ),
                //           Text(
                //             DateFormat('dd/MM/yyyy     hh:mm:ss ')
                //                 .format(widget.transactions[index].date)
                //                 .toString(),
                //             style: TextStyle(color: Colors.grey),
                //           )
                //         ],
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       ),
                //       IconButton(
                //         icon: Icon(
                //           Icons.delete,
                //           color: Colors.red,
                //           size: 25,
                //         ),
                //         onPressed: () {
                //           setState(() {
                //             widget.transactions.removeAt(index);
                //           });
                //         },
                //       )
                //     ],
                //     mainAxisAlignment: MainAxisAlignment.end,
                //   ),
                //   elevation: 50,
                // );
              },
              itemCount: widget.transactions.length,
            ),
    );
  }
}
