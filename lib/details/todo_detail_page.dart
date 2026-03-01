import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list_month3/database/app_database.dart';
import 'package:to_do_list_month3/main.dart';

class TodoDetailPage extends StatefulWidget {
  const TodoDetailPage({super.key});

  @override
  State<StatefulWidget> createState() => _TodoDetailPage();
}

class _TodoDetailPage extends State<TodoDetailPage> {
  late final TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: Text('Details'),
    ),
    body: Padding(
      padding: EdgeInsets.all(15),
      child: Flex(direction: .vertical,
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            label: Text("Test"),
            labelText: 'Название',
            border: OutlineInputBorder()
          ),
        ),
        TextButton(onPressed: () => (), child: Text('Save')),
        TextButton(onPressed: () => (), child: Text('Delete')),
      ],
      ),
      ),
   );
  }

  // Future<void> _update() async {
  //   late final String newTile;
  //   newTile = _controller.text;

  //   await database.updateTodo(widget.item.id, TodosCompanion(title: Value(newTile)));
  //   Navigator.pop(context, true);
  // }

  // Future<void> deleteTodo() async {
  //   await database.deleteTodo(widget.item.id);
  //   Navigator.pop(context, true);
  // }
}