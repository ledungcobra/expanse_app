import 'package:flutter/material.dart';

class CharBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  CharBar({this.label, this.spendingAmount, this.spendingPctOfTotal});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,contraints){
      return Column(
      children: <Widget>[
        Container(
          height: contraints.maxHeight*0.15,
          child: FittedBox(
            child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: contraints.maxHeight*0.05,
        ),
        Container(
            height: contraints.maxHeight*0.6,
            width: contraints.maxWidth*0.45,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        border: Border.all(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            )),
        SizedBox(
          height: contraints.maxHeight*0.05,
        ),
        Container(
          height: contraints.maxHeight*0.1,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(label),
            
          ),
        ),
      ],
    );


    },) ;
    
  }
}
