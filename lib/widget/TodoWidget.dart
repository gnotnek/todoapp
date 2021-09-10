import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp/model/todo.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({
    required this.todo,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Slidable(
          child: buildTodo(context),
          actionPane: SlidableDrawerActionPane(),
          key: Key(todo.id),
          actions: [
            IconSlideAction(
              color: Colors.green,
              onTap: () {},
              caption: 'Edit',
              icon: Icons.edit,
            ),
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.red,
              caption: 'Delete',
              onTap: () {},
              icon: Icons.delete,
            )
          ]));

  Widget buildTodo(BuildContext context) => Container(
      padding: EdgeInsets.all(20),
      color: Colors.white10,
      child: Row(
        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            value: todo.isDone,
            onChanged: (_) {},
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 22),
              ),
              if (todo.desc.isNotEmpty)
                Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      todo.desc,
                      style: TextStyle(fontSize: 20, height: 1.5),
                    ))
            ],
          ))
        ],
      ));
}
