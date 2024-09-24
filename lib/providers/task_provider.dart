import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_lati/models/task_model.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModel> tasks = [];
  addTask(TaskModel tm) {
    tasks.add(tm);
    storeTasks();
    notifyListeners();
  }

  deleteTask(TaskModel tm) {
    tasks.remove(tm);
    storeTasks();
    notifyListeners();
  }

  edit(TaskModel oldTask, TaskModel newTask) {
    tasks.remove(oldTask);
    tasks.add(newTask);
    storeTasks();
    notifyListeners();
  }

  switchValue(TaskModel tm) {
    tm.iscompleted = !tm.iscompleted;
    storeTasks();
    notifyListeners();
  }

  storeTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var json = jsonEncode(tasks.map((t) => t.toJson()).toList());
    if (kDebugMode) {
      print("json from store $json");
    }
    prefs.setString("Tasks", json);
    getTask();
  }

  getTask() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString("Tasks");
    if (data != null) {
      tasks = List<TaskModel>.from(
          jsonDecode(data).map((x) => TaskModel.fromJson(x)));
      notifyListeners();
    }
  }
}
