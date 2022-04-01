import 'package:debt_monitor/controller/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];
  Task addTask(bool isDone, String name, String description) {
    return Task(name: name, description: description);
  }

  int get taskCount {
    return tasks.length;
  }

  void clearList() {
    tasks.clear();
    notifyListeners();
  }
}
