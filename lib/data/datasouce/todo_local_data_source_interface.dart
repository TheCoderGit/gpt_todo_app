import 'package:gpt_todo_app/data/datasouce/todo_data_source.dart';
import 'package:gpt_todo_app/data/entity/todo_entity.dart';
import 'package:sqflite/sqlite_api.dart';

class TodaLocalDataSource implements TodoDataSourceInterface {
  final Database database;

  TodaLocalDataSource(this.database);
  @override
  Future<void> addTodo(TodoEntity todo) {
    return database.insert('todos', _mapEntityToMap(todo));
  }

  @override
  Future<void> deleteTodo(int todoId) {
    return database.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [todoId],
    );
  }

  @override
  Future<List<TodoEntity>> getTodos() async {
    List<Map<String, dynamic>> maps = await database.query('todos');
    return List.generate(maps.length, (index) {
      return TodoEntity(
          id: maps[index]['id'],
          title: maps[index]['title'],
          description: maps[index]['description'],
          isCompleted: maps[index]['is_completed'] == 1);
    });
  }

  @override
  Future<void> updateTodo(int todoId, bool isCompleted) {
    return database.update(
      'todos',
      {'is_completed': isCompleted ? 1 : 0},
      where: 'id = ?',
      whereArgs: [todoId],
    );
  }

  Map<String, dynamic> _mapEntityToMap(TodoEntity entity) {
    return {
      'id': entity.id,
      'title': entity.title,
      'description': entity.description,
      'is_completed': entity.isCompleted ? 1 : 0
    };
  }
}
