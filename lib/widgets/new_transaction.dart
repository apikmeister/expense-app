import 'package:flutter/material.dart';

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

  // Add method function submitData
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    //Check if the enteredTitle and enteredAmount is empty
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      print('Please enter the title and amount');
      return;
    }

    //To access the addTrx function from user_transaction.dart
    widget.addTrx(
      enteredTitle,
      enteredAmount,
    );

    //To close the bottom sheet after user click the button
    Navigator.of(context).pop();
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                print(titleController);
                print(amountController);
                (_) => submitData();
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
