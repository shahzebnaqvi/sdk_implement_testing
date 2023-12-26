// task_controller.dart
import 'package:get/get.dart';
import '../data/models/task.dart';
import '../data/database/database_helper.dart';

class TaskController extends GetxController {
  final DatabaseHelper dbHelper;
  var tasks = <Task>[].obs;

  TaskController(this.dbHelper);

  @override
  void onInit() {
    refreshTaskList();
    super.onInit();
  }

  Future<void> refreshTaskList() async {
    tasks.value = await dbHelper.getTasks();
    update();
  }

  void toggleTaskStatus(Task task) async {
    task.isDone = !task.isDone;
    await dbHelper.updateTask(task);
    refreshTaskList();
  }

  void updateTaskName(Task task, String newName) async {
    task.name = newName;
    await dbHelper.updateTask(task);
    refreshTaskList();
  }

  void addTask(String taskName) async {
    await dbHelper.insertTask(Task( name: taskName, isDone: false));
    print("dssdsd");
    refreshTaskList();

  }
}
