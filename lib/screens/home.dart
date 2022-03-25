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
  TaskTile(),
  TaskTile(),
];

Widget bottomSheetWidget(BuildContext context) {
  return const CircularProgressIndicator();
}

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

class TaskTile extends StatefulWidget {
  const TaskTile({Key? key}) : super(key: key);

  @override
  State<TaskTile> createState() => _TaskTileState();
}

bool stateValue = false;

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Work out",
        style: stateValue
            ? titleFontStyle.copyWith(decoration: TextDecoration.lineThrough)
            : titleFontStyle,
      ),
      subtitle: Text(
        "10 Mins Workout",
        style: stateValue
            ? bodyFontStyle.copyWith(
                fontSize: 12.sp, decoration: TextDecoration.lineThrough)
            : bodyFontStyle.copyWith(fontSize: 12.sp),
      ),
      trailing: IconButton(
        onPressed: () {
          setState(() {
            stateValue = !stateValue;
          });
        },
        icon: Icon(
          stateValue ? Icons.check_box_outlined : Icons.check_box_outline_blank,
          size: 25.sp,
        ),
      ),
    );
  }
}
