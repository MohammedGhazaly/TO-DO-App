import 'package:flutter/material.dart';
import 'package:todo_app/screens/edit_task/widgets/edit_task_body.dart';

class EditTaskScreen extends StatelessWidget {
  static String routeName = "edit-task-screen";
  const EditTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Task",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: const EditTaskBody(),
    );
  }
}
