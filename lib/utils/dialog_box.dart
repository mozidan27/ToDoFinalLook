import 'package:flutter/material.dart';
import 'package:todo/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  DialogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  final controller;

  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Add a new task!',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.grey)),
              ),
            ),

            // buttons , save and cancel

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //save button
                  MyButtonDialog(
                    text: 'Save',
                    onPressed: onSave,
                  ),
                  // cancel button],
                  MyButtonDialog(
                    text: 'Cancel',
                    onPressed: onCancel,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
