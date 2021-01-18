import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_management_examples/screens/add_task_bottom_sheet.dart';
import 'package:state_management_examples/widgets/tasks_list.dart';

import '../task.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              // builder: (context) => AddTaskBottomSheet(),
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskBottomSheet(
                    onButtonClicked: (String value) {
                      setState(() {
                        tasks.add(Task(name: value));
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            );
          },
          backgroundColor: Colors.lightBlueAccent,
          elevation: 5,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  EdgeInsets.only(left: 40, right: 40, bottom: 50, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      size: 40,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${tasks.length} Tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: TasksList(
                  tasks: tasks,
                  onCheckListener: () {
                    setState(() {});
                  },
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
