import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskmanager/models/tasklist.dart';
import 'package:taskmanager/routing/app_router.dart';
import 'package:taskmanager/store/firestore/data_manage_store.dart';
import 'package:taskmanager/views/home/widgets/home_custom_sliver_appbar.dart';
import 'package:taskmanager/views/home/widgets/home_custom_sliver_header.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DataManageStore _firestore = DataManageStore();
  bool? isChecker = false;
  @override
  void initState() {
    _firestore.callGet();
    _firestore.callGetUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 99, 2, 155),
              Color.fromRGBO(181, 54, 255, 1),
            ]),
          ),
          child: CustomScrollView(
            slivers: <Widget>[
              Observer(
                  builder: (context) => CustomSliverAppBar(
                        name: _firestore.mapUser['name'] ?? "--",
                        username: _firestore.mapUser['username'] ?? "--",
                        images: '',
                      )),
              SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: MySliverPersistentHeaderDelegate(
                  minExtent: 0.3.sh,
                  maxExtent: 0.3.sh,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Observer(
                    builder: (context) => _firestore.tasklist.isEmpty
                        ? SizedBox(
                            height: 0.4.sh,
                            child: const Column(
                              children: [
                                Center(
                                  child: Text('No value'),
                                ),
                                Text('----')
                              ],
                            ),
                          )
                        : Column(
                            children: [
                              Observer(
                                builder: (context) => ListView.builder(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 30),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: _firestore.tasklist.length,
                                  itemBuilder: (BuildContext context, index) {
                                    final task = _firestore.tasklist[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      child: Container(
                                        height: 0.1.sh,
                                        padding: const EdgeInsets.all(5),
                                        decoration: const BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              spreadRadius: 6,
                                              blurRadius: 15,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        child: Center(
                                          child: ListTile(
                                            title: Text(task.title),
                                            subtitle: Text(task.subtitle),
                                            leading: Checkbox(
                                                value: task.status,
                                                activeColor: Colors.blueGrey,
                                                onChanged: (newBool) async {
                                                  Task tmpTask = Task(
                                                      title: task.title,
                                                      subtitle: task.subtitle,
                                                      status: newBool!);
                                                  await _firestore.setStatus(
                                                      index, tmpTask);
                                                }),
                                            trailing: IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.info),
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color.fromARGB(228, 134, 136, 231),
        onPressed: () {
          Navigator.pushNamed(context, AppRouter.add);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
