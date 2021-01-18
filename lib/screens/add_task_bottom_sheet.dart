import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatelessWidget {
  final Function onButtonClicked;

  AddTaskBottomSheet({this.onButtonClicked});

  @override
  Widget build(BuildContext context) {
    String strTask;
    return Container(
      color: Color.fromARGB(255, 117, 117, 117),
      child: Container(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.lightBlueAccent,
                ),
              ),
              TextField(
                onChanged: (value) {
                  strTask = value;
                },
                autofocus: true,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                color: Colors.lightBlueAccent,
                textColor: Colors.white,
                child: Text(
                  'Add',
                ),
                onPressed: () {
                  onButtonClicked(strTask);
                },
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
