import 'package:flutter/material.dart';
import 'package:gpt_todo_app/Domain/models/todo.dart';
import 'package:gpt_todo_app/Domain/usecases/todo_usecases.dart';

class TodoListScreen extends StatefulWidget {
  final TodoUsecases usecases;
  const TodoListScreen({super.key, required this.usecases});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> _todos = [];

  @override
  void initState() {
    _loadTodos();
    super.initState();
  }

  void _loadTodos() async {
    List<Todo> todos = await widget.usecases.getTodos();
    setState(() {
      _todos = todos;
    });
  }

  void _addTodo() async {
    Todo todo = Todo(
        id: DateTime.now().microsecond,
        title: 'New Todo',
        description: '',
        isCompleted: false);
    await widget.usecases.addTodo(todo);
    _loadTodos();
  }

  void _toggleTodoStatus(int todoId, bool isCompleted) async {
    await widget.usecases.updateTodo(todoId, isCompleted);
    _loadTodos();
  }

  void _deleteTodo(int todoId) async {
    await widget.usecases.deleteTodo(todoId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (BuildContext context, int index) {
          Todo todo = _todos[index];
          return ListTile(
            title: Text(todo.title),
            subtitle: Text(todo.description),
            trailing: Checkbox(
              onChanged: (bool? value) {
                _toggleTodoStatus(todo.id, value ?? false);
              },
              value: todo.isCompleted,
            ),
            onLongPress: () {
              _deleteTodo(todo.id);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: const Icon(Icons.add),
      ),
    );
  }
}
