import 'dart:io';

import 'package:expence_organizer/models/transaction.dart';
import 'package:expence_organizer/widgets/chart.dart';
import 'package:expence_organizer/widgets/new_transaction.dart';
import 'package:expence_organizer/widgets/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenseScreen extends StatefulWidget {
  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final List<Transaction> userTrans = [
    Transaction(name:'Pants',amount: 66.06,date: DateTime.now(),id: '6' ),
    Transaction(name:'jaket',amount: 99.89,date: DateTime.now(),id: '8' ),
  ];

  List<Transaction> get recentTransactions {
    return userTrans.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.red,
        title: Text('My Expenses',
            style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Chart(recentTransactions),
            SizedBox(height: 100,),
            TransactionList(userTrans , deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startAddNewTrans(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void startAddNewTrans(context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: (){},
            child: NewTransaction(addTrans),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void addTrans(String nameTx, double amountTx, DateTime dateTx) {
    final newTx = Transaction(
        name: nameTx,
        amount: amountTx,
        date: dateTx,
        id: DateTime.now().toString());
        setState(() {
          userTrans.add(newTx);
        });
  }
  void deleteTransaction(String id){
    setState(() {
      userTrans.removeWhere((tx) => tx.id == id );
    });
  }
}
