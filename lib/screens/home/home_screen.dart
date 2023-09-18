import 'package:flutter/material.dart';
import 'package:todo_app/my_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = "/home-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TO Do List",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
          side: BorderSide(color: MyTheme.whiteColor, width: 5),
        ),
        backgroundColor: MyTheme.primaryColor,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: MyTheme.whiteColor,
          size: 28,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: MyTheme.gradientColor.withOpacity(0.35),
            blurRadius: 7,
            // offset: Offset(0, -5),
          )
        ]),
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: MyTheme.whiteColor,
          ),
          child: BottomNavigationBar(
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
      ),
    );
  }
}
