import 'package:tz_laborato/domain/entity/task.dart';

class TaskDTOView {
  const TaskDTOView({required this.tasks});

  final List<Task> tasks;

  int get perHomework =>
      tasks.where((element) => element.status == TaskStatus.homework).length;

  int get perLateHomework => tasks
      .where((element) => element.status == TaskStatus.lateHomework)
      .length;

  int get perRework =>
      tasks.where((element) => element.status == TaskStatus.rework).length;
}
