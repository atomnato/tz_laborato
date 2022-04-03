enum TaskStatus { homework, lateHomework, rework }
enum TaskType { video, fitness, reading, creative, interactive }

class Task {
  final String label;
  final String description;
  final String path;
  final TaskType type;
  final TaskStatus status;

  Task({
    required this.label,
    required this.description,
    required this.path,
    required this.type,
    required this.status,
  });

  factory Task.fromJson(Map<String,dynamic> model){
    TaskType? type;
    TaskStatus? status;

    switch (model['status']){
      case "homework":
        status = TaskStatus.homework;
        break;
      case "late homework":
        status = TaskStatus.lateHomework;
        break;
      case "rework":
        status = TaskStatus.rework;
        break;
    }

    switch (model['type']){
      case "fitness":
        type = TaskType.fitness;
        break;
      case "video":
        type = TaskType.video;
        break;
      case "reading":
        type = TaskType.reading;
        break;
      case "creative":
        type = TaskType.creative;
        break;
      case "interactive":
        type = TaskType.interactive;
        break;
    }
    return Task(
      label: model["title"],
      description: model["description"],
      path: model["image"],
      type: type!,
      status: status!,
    );
  }
}
