import 'package:flutter/material.dart';
import 'package:flutter_todo_app/model/todo.dart';
import '../constants/colors.dart';

class UserInput extends StatelessWidget {
  final textController = TextEditingController();
  final Function insertFunction;
  UserInput({super.key, required this.insertFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                bottom: 20,
                right: 20,
                left: 20,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: 'Add a new todo item',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 20, right: 20),
              child: ElevatedButton(
                  child: Text('+', style: TextStyle(fontSize: 40)),
                  onPressed: () {
                    // create a new todo
                    var myTodo =
                        ToDo(todoText: textController.text, isDone: false);
                    insertFunction(myTodo);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tdBlue,
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  )))
        ],
      ),
    );
  }
}
