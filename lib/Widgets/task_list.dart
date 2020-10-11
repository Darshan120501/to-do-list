import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:to_do_list/models/task.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  TaskList({this.tasks});
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          inCheck: widget.tasks[index].isDone,
          taskTitle: widget.tasks[index].name,
          checkBoxToggle: (bool value) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
