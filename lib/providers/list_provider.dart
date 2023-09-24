import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/services/firebase_services.dart';

class ListsProvider with ChangeNotifier {
  List<TaskModel> tasksList = [];

  void getAllTasksFromFireStore() async {
    var querySnapshot = await FirebaseServices.initCollection().get();

    tasksList =
        querySnapshot.docs.map((taskSnapshot) => taskSnapshot.data()).toList();
    notifyListeners();
  }
}