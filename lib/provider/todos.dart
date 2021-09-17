import 'package:flutter/cupertino.dart';
import 'package:todoapp/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(createdTime: DateTime.now(), title: 'example', id: DateTime.now().toString()),
    Todo(createdTime: DateTime.now(), title: 'expample 2', description: '''
  -makan
  -minum''', id: DateTime.now().toString())
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String desc) {
    todo.title = title;
    todo.description = desc;

    notifyListeners();
  }
}
