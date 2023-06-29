import 'package:gpt_todo_app/data/entity/todo_entity.dart';

abstract class TodoDataSourceInterface {
  Future<void> addTodo(TodoEntity todo);

  Future<void> deleteTodo(int todoId);

  Future<List<TodoEntity>> getTodos();
  Future<void> updateTodo(int todoId, bool isCompleted);
}
