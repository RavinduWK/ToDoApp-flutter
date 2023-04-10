import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';
import '../widgets/todo_list.dart';
import '../widgets/user_input.dart';
import '../model/todo.dart';
import '../services/database.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var db = DatabaseConnect();

  void addItem(ToDo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  void deleteItem(ToDo todo) async {
    await db.deleteTodo(todo);
    setState(() {});
  }

  // List<ToDo> _foundToDo = [];
  // final _todoController = TextEditingController();

  // @override
  // void initState() {
  //   _foundToDo = todosList;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Container(
                  margin: EdgeInsets.only(top: 50, bottom: 20),
                  padding: EdgeInsets.only(right: 220),
                  child: Text(
                    'All ToDos',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Todolist(insertFunction: addItem, deleteFunction: deleteItem),
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: UserInput(insertFunction: addItem))
        ],
      ),
    );
  }

  // void _runFilter(String enteredKeyword) {
  //   List<ToDo> results = [];
  //   if (enteredKeyword.isEmpty) {
  //     results = todosList;
  //   } else {
  //     results = todosList
  //         .where((item) => item.todoText!
  //             .toLowerCase()
  //             .contains((enteredKeyword).toLowerCase()))
  //         .toList();
  //   }

  //   setState(() {
  //     _foundToDo = results;
  //   });

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        // onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: tdBlack,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(
              minHeight: 20,
              minWidth: 25,
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: tdGrey)),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: tdBGColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: tdBlack,
              size: 30,
            ),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/user.png'),
              ),
            ),
          ],
        ));
  }
}
