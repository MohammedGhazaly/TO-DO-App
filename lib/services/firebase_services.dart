import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/task_model.dart';

class FirebaseServices {
  static CollectionReference<TaskModel> initCollection() {
    return FirebaseFirestore.instance
        .collection(TaskModel.collectionName)
        .withConverter<TaskModel>(
      fromFirestore: (snapShot, options) {
        return TaskModel.fromFireStore(snapShot.data()!);
      },
      toFirestore: (taskModel, options) {
        return taskModel.toFireStore();
      },
    );
  }

  static Future<void> addTaskToFirebase(TaskModel task) async {
    var taskCollection = initCollection(); // get/create collection(Class)
    var taskDocument =
        taskCollection.doc(); // create document(Object) with random ID
    task.id = taskDocument.id;
    return await taskDocument.set(task);
  }

  static Future<void> deleteTaskFromFireStore(String id) async {
    await initCollection().doc(id).delete();
  }
}
