import 'package:flutter/material.dart';
import 'package:task_one/Screens/animated_list_screen.dart';
import 'package:task_one/Screens/register_screen.dart';

import 'Screens/login_screen.dart';

void main() {
  runApp(TaskOneApplication());
}

class TaskOneApplication extends StatelessWidget {
  const TaskOneApplication({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName: (_) => LoginScreen(),
        RegisterScreen.routeName: (_) => const RegisterScreen(),
        AnimatedListScreen.routeName: (_) => AnimatedListScreen(),
      },
      //the main screen using "initial Route"
      initialRoute: LoginScreen.routeName,
    );
  }
}
