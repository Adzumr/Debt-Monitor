import 'package:debt_monitor/model/taskModel.dart';
import 'package:debt_monitor/preDefined.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

List<Widget> taskList = [
  TaskTile(),
  TaskTile(),
  TaskTile(),
];

class _ToDoScreenState extends State<ToDoScreen> {
  bool stateValue = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // addTaskMethod(context);
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
                          "${taskList.length} Task(s)",
                          style: bodyFontStyle,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: taskList.length,
                        itemBuilder: (context, index) {
                          return taskList[index];
                        },
                      ),
                    )),
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
