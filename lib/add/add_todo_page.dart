import 'package:flutter/material.dart';
import 'dart:async';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<StatefulWidget> createState() => _AddTodoPage();
}

class _AddTodoPage extends State<AddTodoPage> {
  TextEditingController _textEditingController = TextEditingController();
  late Timer _timer;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Срабатывает один раз и инициализируем задачу
    //К примеру: запрашивать данные с сервера, локально с б.д.
    //
    print('AddTodoPage - initState');
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final date = DateTime.now();
      print('${date.minute}:${date.second}');
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //Когда меняется тема, язык приложения
    print('AddTodoPages - didChangeDependecies');
  }

  @override
  Widget build(BuildContext context) {
    //Рисует нам ui и срабвтывает постоянно при 
    print('AddTodoPage - build');
   return Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text('Добавить задачу'),
    ),
    body:  Column(
      children: [
        SizedBox(height: 50),
        TextField(
          controller: _textEditingController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Название',
          ),
        ),
        SizedBox(height: 30),
        TextButton(onPressed: () => Navigator.of(context).pop(_textEditingController.text), child: Text('Сохранить')),
      ],
    ),
   );
  }

  @override
  void didUpdateWidget(covariant AddTodoPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('AddTodoPage - didUpdateWidget');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    //НЕ используется
    print('AddTodoPage - deactivate');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //Здесь выключаем все таймеры, подписки (Stream)
    //Закрывать все фоновые задачи
    print('AddTodoPage - dispose');
    _timer.cancel();
    _textEditingController.clear();
  }
}