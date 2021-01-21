import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_examples/model/task_data.dart';
import 'package:state_management_examples/screens/add_task_bottom_sheet.dart';
import 'package:state_management_examples/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 70),
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            onLongPressed: () {
              // taskData.deleteTask(task);
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return AddTaskBottomSheet(
                      showTextField: false,
                      title: 'Delete Task ?',
                      buttonTitle: 'Delete!',
                      onButtonClicked: (String value) {
                        taskData.deleteTask(task);
                        Navigator.pop(context);
                      },
                    );
                  });
            },
            taskTitle: task.name,
            isChecked: task.isDone,
            onCheckedChanged: (newValue) {
              taskData.updateTask(task);
            },
          );
        },
        itemCount: taskData.tasks.length,
      );
    });
  }
}
