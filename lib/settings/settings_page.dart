import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDark ? ThemeData.dark() : ThemeData.light(), 
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: ListTile(
          title: Text('DarkTheme'),
          trailing: Switch(
            value: isDark, 
            onChanged: (value) {
              setState(() {
                isDark = value;
              });
            },
            ),
        ),
      ),
      );
  }
}
  