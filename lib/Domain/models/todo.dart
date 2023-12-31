/// the model of the todo

class Todo {
  final int id;
  final String title;
  final String description;
  final bool isCompleted;

  Todo(
      {required this.id,
      required this.title,
      required this.description,
      required this.isCompleted});
}
