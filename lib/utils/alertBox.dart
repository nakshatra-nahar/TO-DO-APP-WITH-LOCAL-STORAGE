import 'package:flutter/material.dart';

import 'myButton.dart';

class ShowDialogBox extends StatelessWidget {
  VoidCallback onSave;
  final filed;
  VoidCallback onCancel;
  ShowDialogBox(
      {super.key,
      required this.onSave,
      required this.onCancel,
      required this.filed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 120,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            TextField(
              controller: filed,
              decoration: InputDecoration(
                  hintText: 'Enter Task To Be Done',
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              MyButton(OnPressed: onSave, text: 'Save'),
              SizedBox(
                width: 10,
              ),
              MyButton(OnPressed: onCancel, text: 'Cancel')
            ])
          ],
        ),
      ),
    );
  }
}
