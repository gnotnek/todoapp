import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String desc;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDesc;
  final VoidCallback onSavedTodo;

  const TodoFormWidget({
    Key? key,
    this.title = '',
    this.desc = '',
    required this.onChangedTitle,
    required this.onChangedDesc,
    required this.onSavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            SizedBox(
              height: 8,
            ),
            buildDesc(),
            SizedBox(
              height: 32,
            ),
            buildSaveButton()
          ],
        ),
      );

  Widget buildTitle() => TextFormField(
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title!.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },
        decoration:
            InputDecoration(border: UnderlineInputBorder(), labelText: 'Title'),
      );

  Widget buildDesc() => TextFormField(
      initialValue: desc,
      onChanged: onChangedDesc,
      decoration: InputDecoration(
          border: UnderlineInputBorder(), labelText: 'Description'));

  Widget buildSaveButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue)),
          onPressed: onSavedTodo,
          child: Text('Save'),
        ),
      );
}
