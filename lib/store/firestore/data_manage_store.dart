import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:taskmanager/models/tasklist.dart';
import 'package:taskmanager/models/users.dart';
import 'package:taskmanager/services/firebase_firestore.dart';

part 'data_manage_store.g.dart';

class DataManageStore = DataManageStoreBase with _$DataManageStore;

abstract class DataManageStoreBase with Store {
  final FirebaseStore _firebaseStore = FirebaseStore();
  @observable
  ObservableList<Task> tasklist = ObservableList<Task>();

  @observable
  ObservableMap<String, dynamic> mapUser = ObservableMap<String, dynamic>();

  @observable
  TextEditingController title = TextEditingController();

  @observable
  TextEditingController subtitle = TextEditingController();

  @action
  void dispose() {
    title.dispose();
    subtitle.dispose();
  }

  @action
  Future<void> setStatus(int index, Task task) async {
    tasklist[index] = task;
    try {
      await callUpdate();
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<bool> _infoUser() async {
    try {
      Users user = await _firebaseStore.getUser();
      mapUser.addAll(user.toMap());
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<bool> _getData() async {
    try {
      List<Task> tmp = await _firebaseStore.featchData();
      tasklist.addAll(tmp);
      return true;
    } catch (e) {
      return false;
    }
  }

  @action
  Future<bool> _addData() async {
    try {
      await _getData();
      Task task = Task(title: title.text, subtitle: subtitle.text);
      tasklist.insert(0, task);
      await _firebaseStore.createTask(tasklist);
      return true;
    } catch (e) {
      return false;
    }
  }

  @action
  Future<bool> _updateData() async {
    try {
      await _firebaseStore.updateTask(tasklist);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> callGet() async {
    await _getData();
  }

  @action
  Future<void> callAdd() async {
    await _addData();
  }

  @action
  Future<void> callGetUser() async {
    await _infoUser();
  }

  @action
  Future<void> callUpdate() async {
    await _updateData();
  }
}
