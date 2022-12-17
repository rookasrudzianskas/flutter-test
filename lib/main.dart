import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Todo {
  final String title;
  final String description;
  final DateTime? dueDate;
  bool completed;

  Todo({
    this.title = '',
    this.description = '',
    this.dueDate,
    this.completed = false,
  });
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Open AI Chat GPT-3'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class TodoList extends StatelessWidget {
  final List<Todo> todos;

  TodoList({@required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return ListTile(
          title: Text(todo.title),
          subtitle: Text(todo.description),
        );
      },
    );
  }
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final todoList = [
    Todo(title: 'Buy milk', description: 'Remember to buy milk at the store'),
    Todo(title: 'Do laundry', description: 'Wash and dry clothes'),
  ];

  void _incrementCounter() {
    setState(() {
      _counter = _counter + 6;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TodoList(
        todos: todoList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
