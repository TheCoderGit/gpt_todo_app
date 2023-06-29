// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoEntity {
  final int id;
  final String title;
  final String description;
  final bool isCompleted;
  TodoEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
  });
}
