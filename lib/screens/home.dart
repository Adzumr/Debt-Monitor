import 'package:debt_monitor/screens/taskScreen.dart';
import 'package:flutter/material.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

bool checkBoxValue = false;
int? task;
List<Widget> taskList = [];
Widget bottomSheetWidget(BuildContext context) {
  return const CircularProgressIndicator();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => const TaskScreen(),
            );
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
                      icon: const Icon(Icons.list),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "To Do",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$task Tasks",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "$task Completed",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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
      ),
    );
  }
}

class TaskWidget extends StatelessWidget {
  String task;
  String taskDescription;
  bool taskValue;
  Function onPressed;
  TaskWidget({
    required this.task,
    required this.onPressed,
    required this.taskDescription,
    required this.taskValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task),
      subtitle: Text(taskDescription),
      trailing: Checkbox(
          value: taskValue,
          onChanged: (value) {
            taskValue = value!;
          }),
    );
  }
}
