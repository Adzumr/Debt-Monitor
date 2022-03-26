import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  String? task;
  String? description;
  TaskTile({
    this.task,
    this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task!),
      subtitle: Text(description!),
      trailing: const Checkbox(
        onChanged: null,
        value: false,
      ),
    );
  }
}
