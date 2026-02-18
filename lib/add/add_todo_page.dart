import 'package:flutter/material.dart';
import 'package:to_do_list_month3/add/add_state.dart';
import 'dart:async';
import 'package:to_do_list_month3/add/add_view_model.dart';
import 'package:to_do_list_month3/database/todo_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoPage extends StatefulWidget{
  final TodoRepository repo;
  const AddTodoPage({super.key, required this.repo});

  @override
  State<StatefulWidget> createState() => _AddTodoPage();
}

class _AddTodoPage extends State<AddTodoPage> {
  TextEditingController _textEditingController = TextEditingController();
  late Timer _timer;
  late final AddCubit cubit;
  
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final date = DateTime.now();
      print("${date.minute}:${date.second}");
    });
    final vm = AddViewModel(repo: widget.repo);
    cubit = AddCubit(vm: vm);
    
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("AddTodoPage - didChangeDependecies");
  }

  @override
  Widget build(BuildContext context) {
    print("AddTodoPage - build");
    return BlocProvider(
      create: (_) => cubit,
      child: BlocListener<AddCubit, AddState>(
        listener: (context, state) {
          if (state.isSaved) {
            Navigator.of(context).pop(true);
          }
        },
     child: Scaffold(
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 10),
              const Text(
                'Новая задача',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              Container(height: 1, color: Colors.black26),
              const SizedBox(height: 18),

              BlocBuilder<AddCubit, AddState> (
                builder: (context, state) {
                  return TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Введите текст',
                      filled: true,
                      fillColor: const Color(0xFFEDEDED),
                      errorText: state.errorText,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        ),
                    ),
                  );
                },
                ),

           const Spacer(),
           SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton.icon(
                  onPressed: () {
                   context.read<AddCubit>().save(_textEditingController.text);
                  },
                  label: const Text(
                    'Сохранить',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A72FF),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
              const SizedBox(height: 16)
          ],
        ),
        ),
        ),
    ),
    ),
    );
  }

  @override
  void didUpdateWidget(covariant AddTodoPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("AddTodoPage - didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("AddTodoPage - deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //Закрывать все фоновые задачи
    print("AddTodoPage - dispose");
    _timer.cancel();
    _textEditingController.dispose();
  }
}