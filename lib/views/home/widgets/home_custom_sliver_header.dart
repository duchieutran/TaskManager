import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskmanager/views/home/widgets/home_custom_cagetory_item.dart';

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  final double minExtent;
  @override
  final double maxExtent;

  MySliverPersistentHeaderDelegate({
    required this.minExtent,
    required this.maxExtent,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 99, 2, 155),
          Color.fromRGBO(181, 54, 255, 1),
        ])),
        padding: EdgeInsets.symmetric(vertical: 0.02.sh, horizontal: 0.04.sw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cagetory",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: HomeCustomCagetoryItem(
                      colors: [
                        Color.fromARGB(255, 40, 197, 147),
                        Color.fromARGB(255, 88, 248, 189),
                      ],
                      cagetory: 'Learn',
                      countTask: '5 tasks',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: HomeCustomCagetoryItem(
                      colors: [
                        Color.fromARGB(235, 240, 166, 55),
                        Color.fromARGB(235, 247, 211, 156),
                      ],
                      cagetory: 'Work',
                      countTask: '5 tasks',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: HomeCustomCagetoryItem(
                      colors: [
                        Color.fromARGB(255, 52, 55, 139),
                        Color.fromARGB(255, 129, 133, 244)
                      ],
                      cagetory: 'Play',
                      countTask: '5 tasks',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: HomeCustomCagetoryItem(
                      colors: [
                        Color.fromARGB(255, 227, 73, 227),
                        Color.fromARGB(255, 255, 165, 244),
                      ],
                      cagetory: 'Learn',
                      countTask: '5 tasks',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: HomeCustomCagetoryItem(
                      colors: [
                        Color.fromARGB(255, 97, 83, 176),
                        Color.fromARGB(255, 174, 130, 241),
                      ],
                      cagetory: 'Learn',
                      countTask: '5 tasks',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return maxExtent != oldDelegate.maxExtent ||
        minExtent != oldDelegate.minExtent;
  }
}
