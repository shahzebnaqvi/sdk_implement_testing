// task_list.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';
import '../data/models/task.dart';

class TaskList extends StatelessWidget {
  final TaskController controller;

  TaskList({required this.controller});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      builder: (TaskController controller) {
        if (controller.tasks.isEmpty) {
          return Center(child: Text('No tasks yet!'));
        } else {
          return ListView.builder(
            itemCount: controller.tasks.length,
            itemBuilder: (context, index) {
              var task = controller.tasks[index];
              return ListTile(
                title: Text(task.name),
                trailing: Checkbox(
                  value: task.isDone,
                  onChanged: (value) {
                    controller.toggleTaskStatus(task);
                  },
                ),
                onTap: () {
                  _showEditTaskDialog(context, controller, task);
                },
              );
            },
          );
        }
      },
    );
  }

  Future<void> _showEditTaskDialog(BuildContext context, TaskController controller, Task task) async {
    TextEditingController _taskController = TextEditingController(text: task.name);

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Task'),
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
                  controller.updateTaskName(task, taskName);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
