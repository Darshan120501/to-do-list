import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/constants.dart';
import 'package:to_do_list/Widgets/task_list.dart';
import 'package:to_do_list/Screens/add_task_screen.dart..';
import 'package:to_do_list/models/task.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainFill,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kMainFill,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(
              taskCallBack: (newTask) {
                setState(() {
                  tasks.add(Task(name: newTask));
                });
              },
            ),
          );
        },
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding:
                EdgeInsets.only(top: 60, bottom: 30.0, right: 30.0, left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    color: kMainFill,
                  ),
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 30.0),
                Text(
                  'To-Do-List',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      tasks.length.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    Text(
                      ' Tasks',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.white,
              elevation: 8.0,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: TaskList(
                  tasks: tasks,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
