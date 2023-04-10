class ToDo {
  int? id;
  String? todoText;
  bool isDone;

  //create the constructor
  ToDo({
    this.id,
    this.todoText,
    this.isDone = false,
  });

  //to save this data in database we need to convert it to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'todoText': todoText,
      'isDone': isDone ? 1 : 0,
    };
  }

  // static List<ToDo> todoList() {
  //   return [
  //     ToDo(id: '01', todoText: "Meditation Session", isDone: true),
  //     ToDo(id: '02', todoText: "Morning Excercise", isDone: true),
  //     ToDo(
  //       id: '03',
  //       todoText: "Check Emails",
  //     ),
  //     ToDo(
  //       id: '04',
  //       todoText: "Team Meeting",
  //     ),
  //     ToDo(
  //       id: '05',
  //       todoText: "Work on mobile apps for 2 hours",
  //     ),
  //     ToDo(
  //       id: '06',
  //       todoText: "Dinner with family members",
  //     ),
  //   ];
  // }
}
