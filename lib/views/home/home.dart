import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  @override
  void initState() {
    _firestore.callGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 112, 1, 177),
            Color.fromRGBO(151, 0, 237, 1),
          ]),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            const CustomSliverAppBar(),
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
                child: Column(
                  children: [
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 50,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(25),
                          child: Container(
                            height: 0.15.sh,
                            padding: const EdgeInsets.all(30),
                            decoration: const BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Text('$index item'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
