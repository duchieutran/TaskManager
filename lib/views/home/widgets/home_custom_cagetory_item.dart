import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCustomCagetoryItem extends StatelessWidget {
  final Color? color;
  final String cagetory;
  final String countTask;
  const HomeCustomCagetoryItem({
    super.key,
    required this.color,
    required this.cagetory,
    required this.countTask,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      padding: const EdgeInsets.all(10),
      height: 0.15.sh,
      width: 0.13.sh,
      child: Column(
        children: [
          const Icon(
            Icons.add,
            color: Colors.white,
          ),
          Text(
            cagetory,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
            ),
          ),
          Text(
            countTask,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }
}
