import 'package:expence_organizer/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text('No Transactions'),
                  Text('yet'),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Colors.white,
                    elevation: 5.0,
                    child: ListTile(
                      title: Text(
                        transactions[index].name,
                      ),
                      subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date)),
                      leading: CircleAvatar(
                        radius: 30,
                        child: Text('\$${transactions[index].amount}'),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      title: Text(
                                        'Delete',
                                        style:
                                            TextStyle(color: Colors.red),
                                      ),
                                      content: Text(
                                        'Do you want to delete this transaction ?',
                                        style:
                                            TextStyle(color: Colors.red),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              deleteTx(transactions[index].id);
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'Yse',
                                              style: TextStyle(
                                                  color: Colors.red),
                                            )),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'No',
                                            style: TextStyle(
                                                color: Colors.red),
                                          ),
                                        )
                                      ]);
                                });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ),
                  );
                },
                itemCount: transactions.length,
              ));
  }
}
