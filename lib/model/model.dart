class ToDo {
  String? id, toDoText;
  bool isDone;

  ToDo({required this.id, required this.toDoText, this.isDone = false});

  static List<ToDo> todolist() {
    return [
      ToDo(id: '01', toDoText: 'Morning Cardio', isDone: true),
      ToDo(id: '02', toDoText: 'Prayer', isDone: true),
      ToDo(id: '03', toDoText: 'Flutter Development'),
      ToDo(id: '04', toDoText: 'Gym Workout'),
      ToDo(id: '05', toDoText: 'Dinner with Margot'),
      ToDo(id: '06', toDoText: 'Check Emails')
    ];
  }
}
