// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoapp/util/my_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "enter the task name"),
            ),
            Row(
              children: [
                MyButton(onPressed: () {}, text: "save"),
                //save button

                //cancel button
                MyButton(onPressed: () {}, text: "cancel")
              ],
            )

            //button->save+cancel
          ],
        ),
      ),
    );
  }
}
