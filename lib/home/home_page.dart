import 'package:flutter/material.dart';
import 'package:to_do_list_month3/add/add_todo_page.dart';
import 'package:to_do_list_month3/database/app_database.dart';
import 'package:to_do_list_month3/database/todo_repository.dart';
import 'package:to_do_list_month3/home/home_state.dart';
import 'package:to_do_list_month3/home/home_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final HomeCubit cubit;
  late final TodoRepositoryImpl repo;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final db = AppDatabase();
    repo = TodoRepositoryImpl(db);
    final vm = HomeViewModel(repo: repo);
    cubit = HomeCubit(vm: vm);
    //View попросил список
    cubit.fetchList();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //Когда меняется тема, язык приложения 
    print("MyHomePage - didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
      //   appBar: AppBar(
      //   title: Text("Мои задачи"),
      // ),
       body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.isEmpty) {
            return Center(child: Text("У вас ни одной задачи!"));
          }

            return Scaffold(
        body: SafeArea(
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                'Мои задачи',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              Container(height: 1, color: Colors.black26),
              const SizedBox(height: 18),

              Expanded(
                child: ListView.separated(
                  itemCount: state.items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    final todoItem = state.items[index];
                    return TodoTile(
                      title: todoItem.title, 
                      dateText: todoItem.date, 
                      isDone: todoItem.isDone, 
                      onChanged: (v) {
                       // setState(() => todoItem.isFinished = v;
                      }
                      );
                  },
                )
                ),
                const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                height: 60,
                // child: ElevatedButton.icon(
                //   onPressed: () {
                //     _navigateToAddTodoPage(context);
                //   },
                //   icon: const Icon(Icons.add, size: 26),
                //   label: const Text(
                //     'Добавить задачу',
                //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                //   ),
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: const Color(0xFF0A72FF),
                //     foregroundColor: Colors.white,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //     elevation: 0,
                //   ),
                // ),
              ),
              const SizedBox(height: 16),
            ],
          ),
          )
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add, color: Colors.white),
            onPressed: () async {
              final result = await Navigator.push(
                context, 
                MaterialPageRoute(builder: (_) => AddTodoPage(repo: repo),
              ),
              );
              if (result == true) {
                setState(() {
                cubit.fetchList();
                });
              }
            },
            ),
       );
        },
      ),
      ),
      );
   
      //  return Scaffold(
      //   body: SafeArea(
      //     child: Padding(padding: const EdgeInsets.symmetric(horizontal: 18),
      //     child: Column(
      //       children: [
      //         const SizedBox(height: 10),
      //         const Text(
      //           'Мои задачи',
      //           style: TextStyle(
      //             fontSize: 28,
      //             fontWeight: FontWeight.w600,
      //             color: Colors.black87,
      //           ),
      //         ),
      //         const SizedBox(height: 10),
      //         Container(height: 1, color: Colors.black26),
      //         const SizedBox(height: 18),

      //         Expanded(
      //           child: ListView.separated(
      //             itemCount: _todoList.length,
      //             separatorBuilder: (_, __) => const SizedBox(height: 14),
      //             itemBuilder: (context, index) {
      //               final todoItem = _todoList[index];
      //               return TodoTile(
      //                 title: todoItem.title, 
      //                 dateText: todoItem.date, 
      //                 isDone: todoItem.isDone, 
      //                 onChanged: (v) {
      //                  // setState(() => todoItem.isFinished = v;
      //                 }
      //                 );
      //             },
      //           )
      //           ),
      //           const SizedBox(height: 14),
      //         SizedBox(
      //           width: double.infinity,
      //           height: 60,
      //           child: ElevatedButton.icon(
      //             onPressed: () {
      //               _navigateToAddTodoPage(context);
      //             },
      //             icon: const Icon(Icons.add, size: 26),
      //             label: const Text(
      //               'Добавить задачу',
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      //             ),
      //             style: ElevatedButton.styleFrom(
      //               backgroundColor: const Color(0xFF0A72FF),
      //               foregroundColor: Colors.white,
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(16),
      //               ),
      //               elevation: 0,
      //             ),
      //           ),
      //         ),
      //         const SizedBox(height: 16),
      //       ],
      //     ),
      //     )
      //     ),
      //  );
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("MyHomePage - didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    //НЕ используется
    print("MyHomePage - deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    //Здесь выключаем все таймеры, подписки (Stream)
    print("MyHomePage - dispose");
  }
}
