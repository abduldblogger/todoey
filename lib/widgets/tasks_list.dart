import 'package:flutter/material.dart';
import 'package:state_management_examples/task.dart';
import 'package:state_management_examples/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  final Function onCheckListener;

  TasksList({@required this.tasks, this.onCheckListener});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 70),
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: tasks[index].name,
          isChecked: tasks[index].isDone,
          onCheckedChanged: (newValue) {
            tasks[index].toggleDone();
            onCheckListener.call();
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
