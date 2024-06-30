import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/util/dialog_box.dart';
import 'package:todoapp/util/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //text control
  final _myBox = Hive.box('_myBox');
  todoDatabase db = todoDatabase(); // Listdb.todoList = [
  //   ["make Bed", false],
  //   ["workout", true]
  // ];

  @override
  void initState() {
    // TODO: implement initState
    //if the first timēpoening the app then the defacult data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //there already is data
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void saveTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      Navigator.of(context).pop();
      _controller.clear();
      db.updateData();
    });
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
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
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            onChanged: (value) => checkBoxChanged(value, index),
            taskDone: db.todoList[index][1],
            taskName: db.todoList[index][0],
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
