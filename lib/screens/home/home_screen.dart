import 'package:flutter/material.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/screens/home/widgets/add_task.dart';
import 'package:todo_app/tabs/settings/settings_list.dart';
import 'package:todo_app/tabs/taks_list/tasks_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = "/home-screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = const [
    TasksTab(),
    SettingsTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("TO Do List", style: Theme.of(context).textTheme.titleLarge),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyTheme.primaryColor,
        shape: StadiumBorder(
          side: BorderSide(color: MyTheme.whiteColor, width: 5),
        ),
        onPressed: () {
          showAddBottomSheet();
        },
        child: Icon(
          Icons.add,
          color: MyTheme.whiteColor,
          size: 28,
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: MyTheme.gradientColor.withOpacity(0.35),
            blurRadius: 7,
          )
        ]),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(
              () {
                currentIndex = index;
              },
            );
          },
          backgroundColor: MyTheme.whiteColor,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.format_list_bulleted,
                ),
                label: "To Do"),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }

  void showAddBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const AddTaskWidget(),
      ),
    );
  }
}
