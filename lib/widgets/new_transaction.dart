import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  //Define the variable for handling changes to a TextField....
  // late String titleInput;
  // late String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  late final Function addTrx;

  NewTransaction(this.addTrx);

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
              //onChanged: (val) => { titleInput = val},   // Note: 1st approach
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
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
                addTrx(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
