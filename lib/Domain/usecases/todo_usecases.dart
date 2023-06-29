import 'package:gpt_todo_app/Domain/models/todo.dart';

abstract class TodoUsecases {
  Future<List<Todo>> getTodos();
  Future<void> addTodo(Todo todo);
  Future<void> updateTodo(int todoId, bool isCompleted);
  Future<void> deleteTodo(int todoId);
}
