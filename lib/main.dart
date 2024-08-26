import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmanager/app.dart';
import 'package:taskmanager/firebase_options.dart';
import 'package:taskmanager/viewmodels/auth_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //Đảm bảo Flutter đã hoàn tất khởi tạo cần thiết trước khi thực hiện các tác vụ khác.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthModel(),
        )
      ],
      child: const App(),
    ),
  );
}
