import 'package:to_do_list_month3/database/app_database.dart';

class HomeState {
  final List<Todo> items;
  final bool isEmpty;

  const HomeState({required this.items, required this.isEmpty});

//исходное состояние до того как просим данные
  factory HomeState.initial() => const HomeState(items: [], isEmpty: true);

  HomeState copyWith({
    List<Todo>? items,
    bool? isEmpty,
  }) {
    return HomeState(items: items ?? this.items, isEmpty: isEmpty ?? this.isEmpty);
  }
}