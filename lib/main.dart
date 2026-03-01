import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list_month3/database/app_database.dart';
import 'package:to_do_list_month3/home/home_page.dart';
import 'settings/settings_page.dart';
import 'add/add_todo_page.dart';

late final AppDatabase database;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  database = AppDatabase();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {

  late SharedPreferences preferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_initPreferences();
  }

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const MyHomePage(title: 'Add tasks'),
    );
  }
}