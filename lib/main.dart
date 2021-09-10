import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/UI/homePage.dart';
import 'package:todoapp/provider/todos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Todo App';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
            primaryColor: Colors.blue,
            scaffoldBackgroundColor: Colors.blueGrey),
        home: HomePage(),
      ));
}
