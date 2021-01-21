import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final Function onCheckedChanged;
  final Function onLongPressed;

  TaskTile(
      {this.taskTitle,
      this.isChecked,
      this.onCheckedChanged,
      this.onLongPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        onLongPressed.call();
      },
      leading: Text(
        taskTitle,
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.w400,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        checkColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: onCheckedChanged,
      ),
    );
  }
}
