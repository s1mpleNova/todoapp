import 'package:flutter/material.dart';
import 'package:todoapp/util/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List todoList = [
    ["make Bed", false],
    ["workout", true]
  ];
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo"),
        elevation: 0,
        backgroundColor: Colors.yellow[200],
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
              onChanged: (value) => checkBoxChanged(value, index),
              taskDone: todoList[index][1],
              taskName: todoList[index][0]);
        },
      ),
    );
  }
}
