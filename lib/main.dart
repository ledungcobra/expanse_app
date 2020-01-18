import 'dart:io';

import 'package:expanse_app/widgets/chart.dart';
import 'package:expanse_app/widgets/new_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense application",
      theme: ThemeData(

        accentColor: Colors.blue,
        fontFamily: 'Quicksand',
        errorColor: Colors.red,
        primaryColor: Colors.purple,
        textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18),
            button: TextStyle(color: Colors.red)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final List<Transaction> _userTransactions = [];
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((item) {
        return item.id == id;
      });
    });
  }

  void addTransaction(Transaction tx) {
    setState(() {
      _userTransactions.add(tx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    //Hien thi sheet tu ben duoi man hinh cho phep nguoi dung nhap vao

    showModalBottomSheet(
        isDismissible: true,
        backgroundColor: Colors.purpleAccent,
        context: ctx,
        isScrollControlled: true,
        builder: (ctx) {
          return FractionallySizedBox(
            heightFactor: 0.8,
            child: GestureDetector(
              child: NewTransaction(addTransaction),
              behavior: HitTestBehavior.opaque,
            ),
          );
          //GestureDetector ngan chan viec sheet auto tat khi touch vao bat
          //ki vi tri nao khong phai text field

          // return GestureDetector(
          //   child: NewTransaction(addTransaction),
          //   onTap: () {},
          //   behavior: HitTestBehavior.opaque,
          // );
        });
  }

  bool switchForChar = true;

  @override
  Widget build(BuildContext context) {
    final isLandscapeMode =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                child: Icon(CupertinoIcons.add),
                onTap: () {
                  _startAddNewTransaction(context);
                }, 
          ),
              ],
            ))
        : AppBar(
            title:
                Text("Flutter App", style: TextStyle(fontFamily: 'OpenSans')),
            backgroundColor: Colors.red,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  _startAddNewTransaction(context);
                },
              )
            ],
          );
    final txListWidget = Container(
        height: 0.6 *
            (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top),
        child: TransactionList(_userTransactions, this._deleteTransaction));
    final pageBody = SafeArea(child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          if (isLandscapeMode)
            Row(
              children: <Widget>[
                Text('Display Chart'),
                Switch.adaptive(
                  value: switchForChar,
                  onChanged: (bool value) {
                    setState(() {
                      switchForChar = value;
                    });
                  },
                )
              ],
            ),
          if (switchForChar)
            Container(
              height: 0.7 *
                  (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top),
              child: Chart(this._recentTransactions),
            ),
          txListWidget
        ],
      ),
    ));
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            backgroundColor: Colors.amberAccent[100],
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      _startAddNewTransaction(context);
                    },
                    elevation: 10,
                  ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          );
  }
}
