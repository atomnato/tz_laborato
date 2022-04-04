import 'package:tz_laborato/domain/entity/task.dart';

class TaskDTOView {
  final List<Task> tasks;

  TaskDTOView(this.tasks);

  List<Task> get taskHomework =>
      tasks.where((element) => element.status == TaskStatus.homework).toList();

  List<Task> get taskLateHomework => tasks
      .where((element) => element.status == TaskStatus.lateHomework)
      .toList();

  List<Task> get taskRework =>
      tasks.where((element) => element.status == TaskStatus.rework).toList();
}
