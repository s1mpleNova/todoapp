import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class todoDatabase {
  List todoList = [];
  //reference the box
  final _myBox = Hive.box('_myBox');

//run this method if the app is oopened for the very first time
  void createInitialData() {
    todoList = [
      ["todolist", "false"],
      ["make tutorial", "true"]
    ];
  }

  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  //update the db
  void updateData() {
    _myBox.put("TODOLIST", todoList);
  }
}
