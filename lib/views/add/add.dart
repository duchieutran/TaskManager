import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/routing/app_router.dart';
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
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRouter.home);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Create Task"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            FadeInUp(
                duration: const Duration(milliseconds: 1800),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromRGBO(143, 148, 251, 1)),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10))
                      ]),
                  child: Column(
                    children: <Widget>[
                      AddTextField(
                          hintText: "Tên công việc",
                          controller: _manageStore.title),
                      AddTextField(
                          hintText: "Nội dung công việc",
                          controller: _manageStore.subtitle),
                    ],
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 1900),
              child: GestureDetector(
                onTap: () {
                  _manageStore.callAdd();
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(143, 148, 251, 1),
                        Color.fromRGBO(143, 148, 251, .6),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Thêm Công Việc",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
