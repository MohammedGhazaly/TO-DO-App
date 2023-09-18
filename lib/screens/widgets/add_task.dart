import 'package:flutter/material.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/screens/widgets/custom_text_form_field.dart';
import 'package:todo_app/screens/widgets/date_time_section.dart';

class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Add new task",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: MyTheme.blackColorLightMode,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            Form(
              child: Column(
                children: [
                  const CustomTextFormField(hintText: "enter task title"),
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomTextFormField(
                    hintText: "enter task description",
                    maxLines: 4,
                  ),
                  const DateTimeSection(),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(
                            horizontal: 100,
                          ),
                        ),
                        backgroundColor: MaterialStatePropertyAll(
                          MyTheme.primaryColor,
                        ),
                        foregroundColor:
                            const MaterialStatePropertyAll(Colors.white)),
                    onPressed: () {},
                    child: const Text(
                      "Add",
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
