import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/todo.dart';

class DatabaseConnect {
  Database? _database;

  // create a getter and open a connection to the databse
  Future<Database> get database async {
    // the location of our database in device.
    final dbpath = await getDatabasesPath();
    // the name of our database
    const dbname = 'todo.db';
    // full path to the database
    final path = join(dbpath, dbname);

    // open the connection
    _database = await openDatabase(path, version: 1, onCreate: _createDB);

    return _database!;
  }

  // function to create tables in our database
  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todo(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        todoText TEXT,
        isDone INTEGER
      )
    ''');
  }

  //function to add data to the database
  Future<void> insertTodo(ToDo todo) async {
    // get the connection to the database
    final db = await database;
    // insert the todo
    await db.insert(
      'todo',
      todo.toMap(),
      conflictAlgorithm:
          ConflictAlgorithm.replace, // to replace duplicate entries
    );
  }

  //function to delete a todo from the database
  Future<void> deleteTodo(ToDo todo) async {
    // get the connection to the database
    final db = await database;
    // delete the todo based on the id
    await db.delete('todo', where: 'id == ?', whereArgs: [todo.id]);
  }

  // function to get all the todo items from the database
  Future<List<ToDo>> getTodo() async {
    final db = await database;

    List<Map<String, dynamic>> items = await db.query(
      'todo',
      orderBy: 'id DESC',
    );

    return List.generate(
      items.length,
      (i) => ToDo(
          id: items[i]['id'],
          todoText: items[i]['todoText'],
          isDone: items[i]['isDone'] == 1 ? true : false),
    );
  }
}
