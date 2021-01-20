import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_examples/model/task_data.dart';
import 'package:state_management_examples/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 70),
        itemBuilder: (context, index) {
          return TaskTile(
            taskTitle: taskData.tasks[index].name,
            isChecked: taskData.tasks[index].isDone,
            onCheckedChanged: (newValue) {
              taskData.tasks[index].toggleDone();
              taskData.notifyTaskDataListeners();
            },
          );
        },
        itemCount: taskData.tasks.length,
      );
    });
  }
}
