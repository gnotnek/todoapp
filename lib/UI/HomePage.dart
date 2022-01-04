// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/provider/todos.dart';
import 'package:todoapp/services/firebase_api.dart';
import 'package:todoapp/widget/AddTodoDialogWidget.dart';
import 'package:todoapp/widget/CompletedListWidget.dart';
import 'package:todoapp/widget/TodoListWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: non_constant_identifier_names
  int selected_index = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [TodoListWidget(), CompletedListWidget()];
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedItemColor: Colors.white,
        currentIndex: selected_index,
        onTap: (index) => setState(() {
          selected_index = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined), label: 'To dos'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.done,
                size: 28,
              ),
              label: 'Completed')
        ],
      ),
      body: StreamBuilder<List<Todo>>(
          stream: FirebaseApi.readTodos(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return buildText('Something Went Wrong Try later');
                } else {
                  final todos = snapshot.data;

                  final provider = Provider.of<TodosProvider>(context);
                  provider.setTodos(todos!);

                  return tabs[selected_index];
                }
            }
          }),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => showDialog(
            context: context,
            builder: (context) => AddTodoDialogWidget(),
            barrierDismissible: false),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      );
}
