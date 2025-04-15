import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/model/taskmodel.dart';
 class FirebaseManager{
  static CollectionReference <TaskModel>getTasksCollection(){
   return FirebaseFirestore.instance.collection("Tasks").withConverter<TaskModel>(
      fromFirestore:(snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },);
  }
  static Future<void> addEvent(TaskModel model){
    var collection = getTasksCollection();
    var docRef= collection.doc();
    model.id=docRef.id;
    return docRef.set(model);

  }
  static Stream<QuerySnapshot<TaskModel>>getData(){
    var collection = getTasksCollection();
    return collection.orderBy("date").snapshots();
  }
  static Future<void>deleteData(String id){
    var collection = getTasksCollection();
    return collection.doc(id).delete();
  }



  static Future<void>updateData(TaskModel model){
    var collection = getTasksCollection();
    return collection.doc(model.id).update(model.toJson());
  }
}