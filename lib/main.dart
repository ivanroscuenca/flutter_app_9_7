import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;
  const Todo(this.title, this.description);
}

List<Todo> todoList = [
  Todo('Paint House', 'Paint it black'),
  Todo('Pet the dog', 'Use a comb to brush as well'),
  Todo('Go to Moon', 'Use a rocket')
];

void main() {
  runApp(MaterialApp(title: 'App', home: TodosScreen(todos: todoList)));
}

//a clave se toma como un argumento opcional (Key? key) y luego se pasa a la clase padre usando super(key: key);.
//Esto es una práctica común en Flutter para asegurarse de que la clase padre reciba la clave adecuada.
class TodosScreen extends StatelessWidget {
  const TodosScreen({Key? key, required this.todos}) : super(key: key);
  final List<Todo> todos;

  @override
  Widget build(Object context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Todos')),
        body: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todos[index].title),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(todo: todos[index]),
                      ));
                },
              );
            }));
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.todo}) : super(key: key);
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    // Trror();ODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(todo.title)),
      body: Center(child: Text(todo.description)),
    );
  }
}
