import 'package:flutter/material.dart';
import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:todo_app/my_theme.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarAgenda(
          selectedDateColor: MyTheme.primaryColor,
          locale: "en",
          events: [],
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date) {},
        )
      ],
    );
  }
}
