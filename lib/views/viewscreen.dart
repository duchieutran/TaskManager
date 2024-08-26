import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:taskmanager/store/navigator/navigator_store.dart';
import 'package:taskmanager/views/home/home.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  PageController controller = PageController();
  final navigatorstore = NavigatorStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        // chú ý item và PageView
        children: const [
          Home(),
          Home(),
          Home(),
        ],
      ),
      bottomNavigationBar: Observer(
        builder: (context) => SlidingClippedNavBar(
          backgroundColor: Colors.black, // màu nền
          onButtonPressed: (index) {
            navigatorstore.setIndex(index);
            controller.animateToPage(navigatorstore.indexCurrent,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          },
          iconSize: 27.sp,
          activeColor: Colors.white, // màu lable khi chọn
          inactiveColor: Colors.white, // đổi màu icon
          selectedIndex: navigatorstore.indexCurrent,
          // dùng barItems để thêm item
          barItems: [
            BarItem(
              icon: Icons.home,
              title: 'Home',
            ),
            BarItem(
              icon: Icons.album,
              title: 'Discovery',
            ),
            BarItem(
              icon: Icons.person,
              title: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
