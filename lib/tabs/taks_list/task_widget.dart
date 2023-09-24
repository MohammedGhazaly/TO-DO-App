import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/providers/app_config_provider.dart';
import 'package:todo_app/providers/list_provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class TaskWidget extends StatelessWidget {
  final TaskModel task;
  const TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    var appConfig = Provider.of<AppConfigProvider>(context);
    var listsProvider = Provider.of<ListsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(15),
              label: "Delete",
              backgroundColor: MyTheme.redColor,
              onPressed: (context) {
                listsProvider
                    .deleteDataFromFireStore(task.id!)
                    .timeout(Duration.zero, onTimeout: () {
                  showTopSnackBar(Overlay.of(context),
                      CustomSnackBar.error(message: "Task removed"));
                  listsProvider.getAllTasksFromFireStore();
                });
              },
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: appConfig.isDarkTheme() ? Color(0xff141922) : Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: MyTheme.primaryColor,
                ),
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.1,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title ?? "",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: MyTheme.primaryColor,
                          ),
                    ),
                    Text(
                      task.description ?? "",
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  // height: 30,
                  // width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: MyTheme.primaryColor,
                  ),
                  child: Icon(
                    Icons.check,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
