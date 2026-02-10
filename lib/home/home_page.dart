import 'package:flutter/material.dart';
import 'package:to_do_list_month3/add/add_todo_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<Task> tasks = []; //[] - изначально пустой список
  final String date = '10.02.26';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('MyHomepage - build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: tasks.length, //Сколько задач
        itemBuilder: (context, index) {
          final task = tasks [index];

          return Card(
            color: Colors.blueAccent,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.title, style: TextStyle(decoration: task.isDone ? TextDecoration.lineThrough : TextDecoration.none, fontSize: 20, color: Colors.white),
                    ), //TextDecoration.lineThrough - это зачеркивает текст
                    Text(task.date, style: TextStyle(fontSize: 12,color: Colors.white),
                    ),
                    SizedBox(height: 10),

                     //ElevatedButton.icon(
                     FloatingActionButton(
                        onPressed: () {
                          setState(() { 
                            tasks[index].isDone = !tasks[index].isDone;
                          });
                        },//icon
                         child: Icon(task.isDone ? Icons.check_box : Icons.check_box_outline_blank),
                         //task.isDone - меняется только эта задача, а не все
                        //label: Text(''),
                        //style: ElevatedButton.styleFrom(
                        //),
                        //),
                     ),
                  ],
                ),
              ),
          );
        },
        ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
    final result = await Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AddTodoPage()),
    );
    //push - открывает экран
    //pop - закрывает экран и возвращает данные 
    //await - главеый экран ждет результат
    if (result != null) {
      setState(() {
        tasks.add(
          Task(
            title: result, 
            date: '10.02.26')
        );
      });
    }
        }
      ),
    );
  }
  
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('MyHomePage - initState');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('MyHomePage - didChangeDependecies');
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('MyHomePage - didUpdateWidget');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('MyHomePage - deactivate');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('MyHomePage - dispose');
  }

}

class Task {
  final String title;
  final String date;
  bool isDone;

  Task({required this.title, required this.date, this.isDone = false});
}