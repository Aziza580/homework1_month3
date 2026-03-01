import 'package:to_do_list_month3/database/app_database.dart';

abstract class TodoRepository {
  //Набор функционала для работы с хранилищем
  Future<List<Todo>> getList();

  Future<void> addTodo(Todo todo);
}

class TodoRepositoryImpl implements TodoRepository {
  //Хранилще
  final AppDatabase db;

  TodoRepositoryImpl(this.db);

//Репозиторий просит данные с хранилищем
  @override
  Future<List<Todo>> getList() => db.getTodoList();
  
  @override
  Future<void> addTodo(Todo todo) => db.getTodoList();
}