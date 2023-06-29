import 'package:gpt_todo_app/Domain/models/todo.dart';
import 'package:gpt_todo_app/data/repository/toso_repo.dart';
import 'package:gpt_todo_app/Domain/usecases/todo_usecases.dart';

class TodoInteractor implements TodoUsecases {
  final TodoRepo repo;

  TodoInteractor(this.repo);

  @override
  Future<void> addTodo(Todo todo) {
    return repo.addTodo(todo);
  }

  @override
  Future<void> deleteTodo(int todoId) {
    return repo.deleteTodo(todoId);
  }

  @override
  Future<List<Todo>> getTodos() {
    return repo.getTodos();
  }

  @override
  Future<void> updateTodo(int todoId, bool isCompleted) {
    return repo.updateTodo(todoId, isCompleted);
  }
}
