import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDark = false;
  late SharedPreferences preferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _initPreferences();
  }

  @override
  Widget build(BuildContext context) {
    //Создаем локальную тему, она будет работать только внутри этого экрана
    return Theme( 
      //условие ? если_да : если_нет
      //Если isDark == true используется ThemeData.dark()
      //Если false, то используется ThemeData.light()
      data: isDark ? ThemeData.dark() : ThemeData.light(), 
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: ListTile(
          title: Text('DarkTheme'),
          //trailing - правая сторона ListTile
          trailing: Switch(
            value: isDark, //Switch показывает текущее значение: если true - вкл, если false - выкл
            onChanged: (value) { //Срабатывает при переключении. value - новое значение (true или false)
              setState(() {
                isDark = value; //Обновляем переменную
              });
            },
            ),
        ),
      ),
      );
  }

  void _initPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _setPreferences() async {}
}
  