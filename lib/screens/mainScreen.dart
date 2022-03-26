import 'package:debt_monitor/model/task.dart';
import 'package:debt_monitor/model/taskData.dart';
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
    dynamic taskLength = Provider.of<TaskData>(context).tasks.length;
    return SafeArea(
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).clearList();

                showModalBottomSheet(
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
                            decoration:
                                const InputDecoration(hintText: "Description"),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                Provider.of<TaskData>(context, listen: false)
                                    .tasks
                                    .add(Task(
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
              },
              child: const Icon(Icons.add),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
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
                          "$taskLength Task(s)",
                          style: bodyFontStyle,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: taskLength,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Text(Provider.of<TaskData>(context)
                                  .tasks[index]
                                  .name),
                              Text(Provider.of<TaskData>(context)
                                  .tasks[index]
                                  .description),
                              Checkbox(
                                value: Provider.of<TaskData>(context)
                                    .tasks[index]
                                    .isDone,
                                onChanged: null,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
