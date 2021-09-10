import 'package:flutter/cupertino.dart';
import 'package:todoapp/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(createdTime: DateTime.now(), title: 'example'),
    Todo(createdTime: DateTime.now(), title: 'expample 2', description: '''
  -makan
  -minum''')
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
}
