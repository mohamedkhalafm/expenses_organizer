//import 'package:expence_organizer/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final Function AddTrans;
  NewTransaction(this.AddTrans);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: EdgeInsetsDirectional.only(start: 10.0, end: 10.0, top: 10.0),
      elevation: 5.0,
      color: Colors.redAccent,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 14.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: TextFormField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
              ),
            ),
            Container(
              height: 70.0,
              child: Row(children: [
               Expanded(
                    child: Text(
                      'Picked Date: ${DateFormat.yMd().format(selectedDate)}',
                    ),
                  ),
                Container(
                  color: Colors.red,
                  child: TextButton(
                      onPressed: () {
                        presentDatePicker();
                      },
                      child: Text('Choose data',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ))),
                )
              ]),
            ),
            Container(
                color: Colors.red,
                child: TextButton(
                    onPressed: submitData,
                    child: Text(
                      'Add Transaction ',
                      style: TextStyle(color: Colors.white),
                    )))
          ],
        ),
      ),
    );
  }

  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = nameController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.AddTrans(enteredTitle, enteredAmount, DateTime.now());

    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
    print('...');
  }
}
