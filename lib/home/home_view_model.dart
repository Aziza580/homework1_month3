import 'package:to_do_list_month3/database/todo_repository.dart';
import 'package:to_do_list_month3/home/home_state.dart';
import 'package:to_do_list_month3/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//описываем viewModel
class HomeViewModel {
  final TodoRepository repo;

  HomeViewModel({required this.repo});

  Future<List<Todo>> fetchList() => repo.getList();

}

//Подвязываем viewMODEL с состоянием
class HomeCubit extends Cubit<HomeState> {
  final HomeViewModel vm;

//При инициализации cubit фиксируем первоначальное состояние 
  HomeCubit({required this.vm}) : super(HomeState.initial());

  Future<void> fetchList() async {
    try {
      final items = await vm.fetchList();
      if (items.isEmpty) {
      //поменять состояние
      emit(state.copyWith(items: items, isEmpty: true));
    } else {
      //поменять состояние
      emit(state.copyWith(items: items, isEmpty: false));
    }
    } catch (e){
      //TODO: добавить состояние ошибки
  }
  }
}