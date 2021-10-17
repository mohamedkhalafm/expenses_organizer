import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double expensesAmount;
  final double expensesPersantage;

  ChartBar(
    this.day,
    this.expensesAmount,
    this.expensesPersantage,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20.0,
          child: FittedBox(child: Text('\$${expensesAmount.toStringAsFixed(0)}')),
        ),
        SizedBox(
          height: 40.0,
        ),
        Container(
          height: 60.0,
          width: 15,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3.0),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: expensesPersantage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40.0,
        ),
        Text(day)
      ],
    );
  }
}
