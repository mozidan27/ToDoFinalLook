import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/Pages/home_page.dart';
import 'package:todo/Pages/welcome_page.dart';

void main() async {
  // Init Hive
  await Hive.initFlutter();

  // Open a box
  var box = await Hive.openBox('mybox');

  // Check if the app has been launched before
  bool launchedBefore = box.get('launchedBefore') ?? false;
  String? userName = box.get('userName');

  runApp(ToDoApp(
    launchedBefore: launchedBefore,
    userName: userName,
  ));
}

class ToDoApp extends StatelessWidget {
  final bool launchedBefore;
  final String? userName;

  const ToDoApp({
    super.key,
    required this.launchedBefore,
    this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          launchedBefore ? HomePage(userName: userName!) : const WelcomePage(),
    );
  }
}
