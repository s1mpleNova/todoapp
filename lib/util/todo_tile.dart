// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final bool taskDone;
  final String taskName;
  Function(bool?)? onChanged;
  TodoTile(
      {super.key,
      required this.taskDone,
      required this.taskName,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Checkbox(value: taskDone, onChanged: onChanged),
          Container(
            padding: EdgeInsets.all(25),
            child: Text(taskName),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}
