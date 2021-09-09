import 'package:flutter/material.dart';
import 'package:todoapp/UI/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Todo App';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
            primaryColor: Colors.blue,
            scaffoldBackgroundColor: Colors.blueGrey),
        home: HomePage(),
      );
}
