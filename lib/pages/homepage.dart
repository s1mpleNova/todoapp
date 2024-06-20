import 'package:flutter/material.dart';
import 'package:todoapp/util/dialog_box.dart';
import 'package:todoapp/util/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //text control
  final _controller = TextEditingController();
  List todoList = [
    ["make Bed", false],
    ["workout", true]
  ];
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void saveTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      Navigator.of(context).pop();
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo"),
        elevation: 0,
        backgroundColor: Colors.yellow[200],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        child: Icon(Icons.add),
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
