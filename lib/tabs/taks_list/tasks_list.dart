import 'package:flutter/material.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/screens/edit_task/edit_task_screen.dart';
import 'package:todo_app/tabs/taks_list/task_widget.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          DateTime.now().subtract(const Duration(days: 7)),
          initialSelectedDate: DateTime.now(),
          selectionColor: MyTheme.primaryColor,
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, EditTaskScreen.routeName);
                },
                child: TaskWidget(),
              );
            },
          ),
        )
      ],
    );
  }
}
