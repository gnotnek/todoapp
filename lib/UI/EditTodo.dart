import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/provider/todos.dart';
import 'package:todoapp/widget/todoFormWidget.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;
  const EditTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();

  late String title;
  late String desc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    title = widget.todo.title;
    desc = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Edit Todo'),
        actions: [
          IconButton(
              onPressed: () {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                provider.removeTodo(widget.todo);

                Navigator.of(context).pop();
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: TodoFormWidget(
              title: title,
              desc: desc,
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDesc: (desc) => setState(() => this.desc = desc),
              onSavedTodo: saveTodo,
            ),
          )));

  void saveTodo() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.updateTodo(widget.todo, title, desc);
      Navigator.of(context).pop();
    }
  }
}
