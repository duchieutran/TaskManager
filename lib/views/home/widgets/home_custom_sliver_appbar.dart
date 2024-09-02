import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 0,
      elevation: 0,
      pinned: true,
      centerTitle: false,
      expandedHeight: 0.28.sh,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          padding: EdgeInsets.symmetric(vertical: 0.07.sh, horizontal: 0.1.sw),
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 112, 1, 177),
              Color.fromRGBO(151, 0, 237, 1),
            ]),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trần Đức Hiếu',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.sp),
                      ),
                      Text(
                        'hieucutequa',
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                      )
                    ],
                  ),
                  CircleAvatar(
                    radius: 30.sp,
                    child: Image.asset('assets/images/clock.png'),
                  )
                ],
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      color: Colors.white60,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white60,
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Colors.white60,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
