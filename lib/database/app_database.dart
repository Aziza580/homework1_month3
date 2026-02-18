import 'package:to_do_list_month3/todo.dart';

class AppDatabase {
  //MOCK -   временные данных, чтобы можно было протестировать
  List<Todo> _todoList = [
   Todo(id: 1, title: "Сделать домашнее задание", date: "20.01.2026", isDone: false), 
   Todo(id: 2, title: "Купить телефон", date: "27.01.2026", isDone: true),
   Todo(id: 3, title: "Съездить в Турцию", date: "08.02.2026", isDone: false),
   Todo(id: 4, title: "Прочитать книгу", date: "12.02.2026", isDone: false)
  ];

  //CRUD OPERATIONS

  //CREATE - добавить данные
Future<void> addTodo(Todo todo) async {
  _todoList.add(todo);
}

  //READ - считать даныне
  //получить список
Future<List<Todo>> getList() async {
  return List.unmodifiable(_todoList);
}

  //UPDATE - обновить данные (редактировать)

  //DELETE - удалить данные
}