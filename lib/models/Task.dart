class Task {
  String? id;
  String? todoText;
  bool isDone;

  Task({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });


}