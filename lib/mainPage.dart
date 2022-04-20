import 'package:flutter/material.dart';
import 'package:tugas_sharepref_localdb/mainPage2.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/todo.dart';

//void mainApp() async{
//  Hive.initFlutter();
//  Hive.registerAdapter(TodoAdapter());
//  await Hive.openBox<Todo>(HiveBoxex.todo);
// } runApp(MainPage();

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopper App"),
      ),
      body: MainPage2(),
    );
  }
}