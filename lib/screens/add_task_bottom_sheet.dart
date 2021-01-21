import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatelessWidget {
  final Function onButtonClicked;
  final String title;
  final String buttonTitle;
  final bool showTextField;

  AddTaskBottomSheet(
      {@required this.onButtonClicked,
      this.title = 'Add Task',
      this.buttonTitle = 'Add',
      this.showTextField = true});

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
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.lightBlueAccent,
                ),
              ),
              (showTextField)
                  ? TextField(
                      onChanged: (value) {
                        strTask = value;
                      },
                      autofocus: true,
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 20,
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                color: Colors.lightBlueAccent,
                textColor: Colors.white,
                child: Text(
                  buttonTitle,
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
