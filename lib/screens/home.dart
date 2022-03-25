import 'package:debt_monitor/preDefined.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

bool checkBoxValue = false;
int? task;
List<Widget> taskList = [
  TaskWidget(
    task: "Workout",
    taskValue: true,
    onPressed: () {},
  ),
];

Widget bottomSheetWidget(BuildContext context) {
  return const CircularProgressIndicator();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
            backgroundColor: Colors.lightBlueAccent,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // addTaskMethod(context);
              },
              child: const Icon(Icons.add),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.list,
                            size: 20.sp,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "To Do",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: whiteColorColor, fontSize: 30.sp),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$task Tasks",
                          ),
                          Text(
                            "$task Completed",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
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
          );
        },
      ),
    );
  }
}

class TaskWidget extends StatelessWidget {
  String? task;
  String? taskDescription;
  bool? taskValue;
  Function? onPressed;
  TaskWidget({
    this.task,
    this.onPressed,
    this.taskDescription,
    this.taskValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task ?? ""),
      subtitle: Text(taskDescription ?? ""),
      trailing: Checkbox(
          value: taskValue ?? false,
          onChanged: (value) {
            onPressed!();
          }),
    );
  }
}
