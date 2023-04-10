import 'package:flutter/material.dart';
import '../model/todo.dart';

import '../constants/colors.dart';

class TodoItem extends StatefulWidget {
  final int id;
  final String todoText;
  bool isDone;
  final Function insertFunction;
  final Function deleteFunction;

  TodoItem(
      {Key? key,
      required this.id,
      required this.todoText,
      required this.isDone,
      required this.insertFunction,
      required this.deleteFunction})
      : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    // local todo
    var anotherTodo =
        ToDo(id: widget.id, todoText: widget.todoText, isDone: widget.isDone);

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Checkbox(
          value: widget.isDone,
          onChanged: (bool? value) {
            setState(() {
              widget.isDone = value!;
            });
            anotherTodo.isDone = value!;
            widget.insertFunction(anotherTodo);
          },
        ),
        title: Text(
          widget.todoText,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: widget.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: tdRed,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
                color: Colors.white,
                iconSize: 18,
                icon: Icon(Icons.delete),
                onPressed: () {
                  widget.deleteFunction(anotherTodo);
                })),
      ),
    );
  }
}
