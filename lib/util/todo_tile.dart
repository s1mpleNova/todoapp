// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final bool taskDone;
  final String taskName;
  final Function(bool?)? onChanged;

  TodoTile({
    super.key,
    required this.taskDone,
    required this.taskName,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Checkbox(
              value: taskDone,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
            Expanded(
              child: Text(
                taskName,
                style: TextStyle(
                  decoration: taskDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
