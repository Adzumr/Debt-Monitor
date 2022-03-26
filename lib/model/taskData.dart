import 'package:debt_monitor/model/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];
  Task addTask(bool isDone, String name, String description) {
    Task newTask = Task(isDone: isDone, name: name, description: description);
    return newTask;
  }

  void clearList() {
    tasks.clear();
    notifyListeners();
  }
}
