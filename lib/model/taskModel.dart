import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../preDefined.dart';

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