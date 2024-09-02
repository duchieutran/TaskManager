import 'package:flutter/material.dart';
import 'package:taskmanager/store/firestore/data_manage_store.dart';
import 'package:taskmanager/views/add/widgets/add_textfield.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final DataManageStore _manageStore = DataManageStore();

  @override
  void dispose() {
    _manageStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Task"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AddTextField(hintText: 'Title', controller: _manageStore.title),
          AddTextField(hintText: 'Subtitle', controller: _manageStore.subtitle),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              _manageStore.callAdd();
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
