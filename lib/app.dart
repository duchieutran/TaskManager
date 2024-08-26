import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskmanager/routing/app_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // kích thước mặc định để căn chỉnh
      minTextAdapt: true, // cho phép thay đổi kích thước chữ từng tỉ lệ
      splitScreenMode: true,
      child: MaterialApp(
        onGenerateRoute: AppRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor:
                  Colors.lightBlue), // màu xuyên suốt trong toàn bộ ứng dụng
          useMaterial3: true, // sử dụng Material3
        ),
      ),
    );
  }
}
