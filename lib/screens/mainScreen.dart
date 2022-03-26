import 'package:debt_monitor/controller/task.dart';
import 'package:debt_monitor/model/taskData.dart';
import 'package:debt_monitor/model/taskTile.dart';
import 'package:debt_monitor/preDefined.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    String? task;
    String? description;
    bool? isdone;
    return SafeArea(
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                ShowModelMethod(description: description, task: task);
              },
              child: const Icon(Icons.add),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Consumer<TaskData>(
                  builder: (context, taskData, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "To Do",
                            style: headFontStyle,
                          ),
                          Text(
                            "${taskData.taskCount} Task(s)",
                            style: bodyFontStyle,
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: taskData.taskCount,
                          itemBuilder: (context, index) {
                            return TaskTile(
                              task: taskData.tasks[index].name,
                              description: taskData.tasks[index].description,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> ShowModelMethod({
    context,
    String? task,
    String? description,
  }) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: [
              TextField(
                onChanged: ((value) {
                  task = value;
                }),
                decoration: const InputDecoration(hintText: "Task"),
              ),
              TextField(
                onChanged: ((value) {
                  description = value;
                }),
                decoration: const InputDecoration(hintText: "Description"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    Provider.of<TaskData>(context, listen: false).tasks.add(
                        Task(
                            description: description!,
                            name: task!,
                            isDone: false));

                    Navigator.pop(context);
                  });
                },
                child: const Text("Add"),
              )
            ],
          );
        });
  }
}
