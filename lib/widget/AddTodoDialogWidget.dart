import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/provider/todos.dart';
import 'todoFormWidget.dart';

class AddTodoDialogWidget extends StatefulWidget {
  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String desc = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
          content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add To do',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(height: 8),
            TodoFormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDesc: (description) =>
                    setState(() => this.desc = description),
                onSavedTodo: addTodo)
          ],
        ),
      ));

  void addTodo() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      final todo = Todo(
          id: DateTime.now().toString(),
          title: title,
          description: desc,
          createdTime: DateTime.now());

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);
      Navigator.of(context).pop();
    }
  }
}
