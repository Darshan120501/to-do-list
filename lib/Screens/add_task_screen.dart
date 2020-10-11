import 'package:flutter/material.dart';
import 'package:to_do_list/constants.dart';

class AddTaskScreen extends StatefulWidget {
  final Function taskCallBack;
  AddTaskScreen({this.taskCallBack});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String addTaskText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'Add Task',
                  style: TextStyle(
                      color: kMainFill,
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              TextField(
                onChanged: (newValue) {
                  addTaskText = newValue;
                },
                autofocus: true,
                cursorColor: kMainFill,
                textAlign: TextAlign.center,
              ),
              FlatButton(
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
                color: kMainFill,
                onPressed: () {
                  widget.taskCallBack(addTaskText);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
