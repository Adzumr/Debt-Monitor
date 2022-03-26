import 'package:debt_monitor/model/task.dart';
import 'package:flutter/foundation.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Workout', description: "10 mins daily"),
    Task(name: 'Workout', description: "10 mins daily"),
    Task(name: 'Workout', description: "10 mins daily"),
  ];
}
