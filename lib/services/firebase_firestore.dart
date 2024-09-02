import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskmanager/models/tasklist.dart';

class FirebaseStore {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? _user = FirebaseAuth.instance.currentUser;

  // add
  Future<void> createTask(List<Task> task) async {
    try {
      _firestore.collection('tasklists').doc(_user!.uid.toString()).set(
          {'tasks': task.map((value) => value.toJson()).toList()},
          SetOptions(merge: true));
    } catch (e) {
      rethrow;
    }
  }

  // get
  Future<List<Task>> featchData() async {
    try {
      DocumentSnapshot documentSnapshot = await _firestore
          .collection('tasklists')
          .doc(_user!.uid.toString())
          .get();
      Map<String, dynamic> task =
          documentSnapshot.data() as Map<String, dynamic>;
      List<dynamic> tmp =
          task['tasks'].map((value) => Task.fromJson(value)).toList();
      List<Task> listTask = tmp.cast<Task>();
      return listTask;
    } catch (e) {
      rethrow;
    }
  }
}
