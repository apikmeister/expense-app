import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  late final Function addTrx;

  NewTransaction(this.addTrx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  //Define the variable for handling changes to a TextField....
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  late DateTime _selectedDate = DateTime.now();

  // Add method function submitData
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    final enteredDate = _selectedDate;

    //Check if the enteredTitle and enteredAmount is empty
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      print('Please enter the title and amount');
      return;
    }

    //To access the addTrx function from user_transaction.dart
    widget.addTrx(
      enteredTitle,
      enteredAmount,
      enteredDate,
    );

    //To close the bottom sheet after user click the button
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      //To check if the user cancel the date picker
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              //onChanged: (val) => { titleInput = val},   // Note: 1st approach
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              //onChanged: (val) => { amountInput = val},
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _presentDatePicker();
                    },
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                print(titleController);
                print(amountController);
                submitData();
                // addTrx(
                //   titleController.text,
                //   double.parse(amountController.text),
                // );
              },
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
