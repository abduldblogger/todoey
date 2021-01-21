import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:state_management_examples/model/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [];

  void addTask(String task) {
    _tasks.add(Task(name: task));
    notifyListeners();
  }

  /// don't use this to add data into list
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get length {
    return _tasks.length;
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
