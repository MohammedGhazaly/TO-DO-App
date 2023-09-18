import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/my_theme.dart';

class DateTimeSection extends StatefulWidget {
  const DateTimeSection({
    super.key,
  });

  @override
  State<DateTimeSection> createState() => _DateTimeSectionState();
}

class _DateTimeSectionState extends State<DateTimeSection> {
  String currentDate = DateFormat.yMd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "Select date",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            IconButton(
              onPressed: () async {
                await showCursomDatePicker();
              },
              icon: Icon(
                Icons.calendar_month,
                color: MyTheme.primaryColor,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          currentDate,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  showCursomDatePicker() async {
    var chosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );
    if (chosenDate == null) {
      return;
    }
    setState(() {});
    currentDate = DateFormat.yMd().format(chosenDate);
  }
}
