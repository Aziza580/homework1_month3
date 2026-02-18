import 'package:to_do_list_month3/add/add_state.dart';
import 'package:to_do_list_month3/database/todo_repository.dart';
import 'package:to_do_list_month3/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddViewModel {
  final TodoRepository repo;

  const AddViewModel({required this.repo});

  Future<void> save(String title) async {
    final newTodo = Todo(
      id: DateTime.now().microsecondsSinceEpoch, 
      title: title, 
      date: '18.02.28', 
      isDone: false);
      await repo.addTodo(newTodo);
  }
}

class AddCubit extends Cubit<AddState> {
  final AddViewModel vm;

  AddCubit({required this.vm}) : super(AddState.initial());

  Future<void> save(String text) async {
    if (text.isEmpty) {
      emit(state.copyWith(errorText: 'Заполните поле'));
      return;
    }
    await vm.save(text);

    emit(state.copyWith(isSaved: true, errorText: null));
  }
}