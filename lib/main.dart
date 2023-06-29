import 'package:flutter/material.dart';
import 'package:gpt_todo_app/Domain/usecases/todo_interactor.dart';
import 'package:gpt_todo_app/Domain/usecases/todo_usecases.dart';
import 'package:gpt_todo_app/data/datasouce/todo_local_data_source_interface.dart';
import 'package:gpt_todo_app/data/repoImpl/todo_repo_impl.dart';
import 'package:gpt_todo_app/presentation/todo_list_screen.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await openDatabase(
    'todo.db',
    version: 1,
    onCreate: (db, version) {
      db.execute('''
      CREATE TABLE todos (
          id INTEGER PRIMARY KEY,
          title TEXT,
          description TEXT,
          is_completed INTEGER
        )
      ''');
    },
  );

  final dataSource = TodaLocalDataSource(database);
  final repository = TodoRepoImpl(dataSource);
  final useCase = TodoInteractor(repository);

  runApp(MyApp(
    usecases: useCase,
  ));
}

class MyApp extends StatelessWidget {
  final TodoUsecases usecases;
  const MyApp({super.key, required this.usecases});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TodoListScreen(
        usecases: usecases,
      ),
    );
  }
}
