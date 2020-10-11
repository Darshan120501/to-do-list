import 'package:flutter/material.dart';
import 'package:to_do_list/constants.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool inCheck;
  final Function checkBoxToggle;
  TaskTile({this.inCheck, this.taskTitle, this.checkBoxToggle});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            fontSize: 20.0,
            decoration: inCheck ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: kMainFill,
        value: inCheck,
        onChanged: checkBoxToggle,
      ),
    );
  }
}
