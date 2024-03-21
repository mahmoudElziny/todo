import 'package:flutter/material.dart';
import 'package:todo/firebase_utils.dart';
import 'package:todo/models/task_model.dart';

class TasksProvider with ChangeNotifier {
  List<TaskModel> tasks = [];
  DateTime selectedDate = DateTime.now();

  Future<void> getTasks() async {
    final alltasks =
        await FirebaseUtils.getAllTasksFromFirebase().catchError((error) {
      'Error: $error';
    });
    tasks = alltasks
        .where((task) =>
            task.dateTime.day == selectedDate.day &&
            task.dateTime.month == selectedDate.month &&
            task.dateTime.year == selectedDate.year)
        .toList();
    tasks.sort((task, nextTask) => task.dateTime.compareTo(nextTask.dateTime));
    notifyListeners();
  }

  void changeSelectedDate(DateTime dateTime) {
    selectedDate = dateTime;
    getTasks();
  }
}
