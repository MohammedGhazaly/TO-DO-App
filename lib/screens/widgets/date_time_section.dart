import 'package:flutter/material.dart';
import 'package:todo_app/my_theme.dart';

class DateTimeSection extends StatefulWidget {
  const DateTimeSection({
    super.key,
  });

  @override
  State<DateTimeSection> createState() => _DateTimeSectionState();
}

class _DateTimeSectionState extends State<DateTimeSection> {
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
              onPressed: () {},
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
          "16/9/2023",
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
