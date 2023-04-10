import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../services/database.dart';
import '../widgets/todo_item.dart';

class Todolist extends StatelessWidget {
  // create an object of database connect
  final Function insertFunction;
  final Function deleteFunction;
  final db = DatabaseConnect();
  Todolist(
      {super.key, required this.insertFunction, required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: db.getTodo(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            var data = snapshot.data; // data we have to show
            var datalength = data!.length;

            return datalength == 0
                ? const Center(
                    child: Text('no data found'),
                  )
                : ListView.builder(
                    itemCount: datalength,
                    itemBuilder: (context, i) => TodoItem(
                        id: data[i].id,
                        todoText: data[i].todoText,
                        isDone: data[i].isDone,
                        insertFunction: insertFunction,
                        deleteFunction: deleteFunction),
                  );
          }),
    );
  }
}
