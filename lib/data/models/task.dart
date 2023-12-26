// task.dart
class Task {
  final id;
  String name;
  bool isDone;

  Task({ this.id, required this.name, required this.isDone});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'isDone': isDone ? 1 : 0};
  }
}
