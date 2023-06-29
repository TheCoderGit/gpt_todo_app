import 'package:gpt_todo_app/Domain/models/todo.dart';
import 'package:gpt_todo_app/data/datasouce/todo_data_source.dart';
import 'package:gpt_todo_app/data/entity/todo_entity.dart';
import 'package:gpt_todo_app/data/repository/toso_repo.dart';

class TodoRepoImpl implements TodoRepo {
  final TodoDataSourceInterface dataSource;

  TodoRepoImpl(this.dataSource);

  @override
  Future<void> addTodo(Todo todo) {
    TodoEntity entity = _mapModelToEntity(todo);
    return dataSource.addTodo(entity);
  }

  @override
  Future<void> deleteTodo(int todoId) {
    return dataSource.deleteTodo(todoId);
  }

  @override
  Future<List<Todo>> getTodos() async {
    List<TodoEntity> entities = await dataSource.getTodos();
    return entities.map((e) => _mapEntityToModel(e)).toList();
  }

  @override
  Future<void> updateTodo(int todoId, bool isCompleted) {
    return dataSource.updateTodo(todoId, isCompleted);
  }

  TodoEntity _mapModelToEntity(Todo todo) {
    return TodoEntity(
        id: todo.id,
        title: todo.title,
        description: todo.description,
        isCompleted: todo.isCompleted);
  }

  Todo _mapEntityToModel(TodoEntity entity) {
    return Todo(
        id: entity.id,
        title: entity.title,
        description: entity.description,
        isCompleted: entity.isCompleted);
  }
}
