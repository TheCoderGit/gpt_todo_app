import 'package:gpt_todo_app/Domain/models/todo.dart';

///the repo that define the use cases
abstract class TodoRepo {
  Future<List<Todo>> getTodos();
  Future<void> addTodo(Todo todo);
  Future<void> updateTodo(int todoId, bool isCompleted);
  Future<void> deleteTodo(int todoId);
}
