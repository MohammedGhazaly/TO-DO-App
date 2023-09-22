import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/screens/edit_task/edit_task_screen.dart';
import 'package:todo_app/screens/home/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
  runApp(const TODO());
}

class TODO extends StatelessWidget {
  const TODO({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO App',
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: HomeScreen.routeName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale("ar"),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        EditTaskScreen.routeName: (context) => const EditTaskScreen(),
      },
    );
  }
}
