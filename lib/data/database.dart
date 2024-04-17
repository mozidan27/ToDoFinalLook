import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
//
  List toDoList = [];
// referance the box

  final _myBox = Hive.box('mybox');

  //run this method if this is the 1st time opening this app
  void createInitialData() {
    toDoList = [
      ['Enter your task by using + button', false],
      // ['Do something else', false]
    ];
  }

  // load the data from data base

  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  // update the database
  void updateDataBase() {
    _myBox.put('TODOLIST', toDoList);
  }
}
