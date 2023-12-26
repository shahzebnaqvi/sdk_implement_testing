import 'package:flutter/material.dart';
import 'package:sdk_implement_testing/data/database/database_helper.dart';
import 'package:sdk_implement_testing/screens/task_list.dart';
import '../controllers/task_controller.dart';

class AddTodo extends StatelessWidget {
  final TaskController controller = TaskController(DatabaseHelper());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do App'),
      ),
      body: TaskList(controller: controller),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context, controller);
        },
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddTaskDialog(BuildContext context, TaskController controller) async {
    TextEditingController _taskController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: TextField(
            controller: _taskController,
            decoration: InputDecoration(hintText: 'Enter task name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                String taskName = _taskController.text.trim();
                if (taskName.isNotEmpty) {
                  controller.addTask(taskName);
                  Navigator.of(context).pop();
                }
                controller.update();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
