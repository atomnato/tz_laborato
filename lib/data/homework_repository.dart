import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:tz_laborato/domain/entity/task.dart';

class HomeworkRepository {
  Future<List<Task>> fetchData() async {
    final String response =
        await rootBundle.loadString('assets/data_homework_task.json');
    final Map<String,dynamic> data = jsonDecode(response);
    final List<Task> taskList =
        data["tasks"].map<Task>((e) => Task.fromJson(e)).toList();

    return taskList;
  }
}
