import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/todos.dart';
import 'package:todoapp/widget/TodoWidget.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return todos.isEmpty
        ? Center(
            child: Text(
            'No To do',
            style: TextStyle(fontSize: 20),
          ))
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            },
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: todos.length);
  }
}
