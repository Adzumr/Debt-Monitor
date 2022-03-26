import 'package:debt_monitor/preDefined.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
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
              onPressed: () {},
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
                          "Task(s)",
                          style: bodyFontStyle,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              "Task",
                              style: bodyFontStyle,
                            ),
                            subtitle: Text(
                              "Task Description",
                              style: bodyFontStyle.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal),
                            ),
                            trailing: Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
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
