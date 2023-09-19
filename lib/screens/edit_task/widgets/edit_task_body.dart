import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/screens/home/widgets/custom_text_form_field.dart';

class EditTaskBody extends StatefulWidget {
  const EditTaskBody({super.key});

  @override
  State<EditTaskBody> createState() => _EditTaskBodyState();
}

class _EditTaskBodyState extends State<EditTaskBody> {
  String currentDate = DateFormat.yMd().format(DateTime.now());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.07,
          vertical: MediaQuery.of(context).size.width * 0.1,
        ),
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: MyTheme.whiteColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: "This is title",
                validationMessage: "Please enter task title",
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                hintText: "This is description",
                validationMessage: "Please enter task description",
                maxLines: 4,
              ),
              const SizedBox(
                height: 24,
              ),
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
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(
                        horizontal: 50,
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                      MyTheme.primaryColor,
                    ),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: const Text(
                  "Save changes",
                ),
              )
            ],
          ),
        ),
      ),
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
