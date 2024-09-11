import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskmanager/models/tasklist.dart';
import 'package:taskmanager/models/users.dart';

class FirebaseStore {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? _user = FirebaseAuth.instance.currentUser;

  // create user
  Future<void> informationUser(Users user, User uidUser) async {
    try {
      await _firestore
          .collection('users')
          .doc(uidUser.uid.toString())
          .set({'user': user.toMap()});
    } catch (e) {
      rethrow;
    }
  }

  // getuser
  Future<Users> getUser() async {
    try {
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('users').doc(_user!.uid.toString()).get();
      Map<String, dynamic> userMap =
          documentSnapshot.data() as Map<String, dynamic>;
      Users users = Users.fromJson(userMap['user']);
      return users;
    } catch (e) {
      rethrow;
    }
  }

  // add
  Future<void> createTask(List<Task> task) async {
    try {
      await _firestore.collection('tasklists').doc(_user!.uid.toString()).set(
          {'tasks': task.map((value) => value.toJson()).toList()},
          SetOptions(merge: true));
    } catch (e) {
      rethrow;
    }
  }

  //update
  Future<void> updateTask(List<Task> task) async {
    try {
      await _firestore
          .collection('tasklists')
          .doc(_user!.uid.toString())
          .update({'tasks': task.map((value) => value.toJson()).toList()});
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
