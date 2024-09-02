import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:taskmanager/models/tasklist.dart';
import 'package:taskmanager/services/firebase_firestore.dart';

part 'data_manage_store.g.dart';

class DataManageStore = DataManageStoreBase with _$DataManageStore;

abstract class DataManageStoreBase with Store {
  final FirebaseStore _firebaseStore = FirebaseStore();
  @observable
  ObservableList<Task> tasklist = ObservableList<Task>();

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
  Future<void> callGet() async {
    await _getData();
  }

  @action
  Future<void> callAdd() async {
    await _addData();
  }
}
