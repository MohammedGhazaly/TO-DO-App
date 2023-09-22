import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/screens/home/widgets/custom_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({super.key});

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  String currentDate = DateFormat.yMd().format(DateTime.now());

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.new_task,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: MyTheme.blackColorLightMode,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                      hintText: AppLocalizations.of(context)!.task_title,
                      validationMessage:
                          AppLocalizations.of(context)!.task_title_validation),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    hintText: AppLocalizations.of(context)!.task_description,
                    validationMessage: AppLocalizations.of(context)!
                        .task_description_validation,
                    maxLines: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.select_date,
                        style: const TextStyle(
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
                            horizontal: 100,
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
                    child: Text(
                      AppLocalizations.of(context)!.add,
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
