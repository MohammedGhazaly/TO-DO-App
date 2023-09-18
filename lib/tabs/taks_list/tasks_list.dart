import 'package:flutter/material.dart';
import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/tabs/taks_list/task_widget.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarAgenda(
          selectedDateColor: MyTheme.primaryColor,
          locale: "ar",
          events: [
            DateTime.now(),
            DateTime.now().add(Duration(days: 2)),
          ],
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date) {},
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return TaskWidget();
              }),
        )
      ],
    );
  }
}
