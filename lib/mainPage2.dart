import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tugas_sharepref_localdb/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_sharepref_localdb/models/todo.dart';
import 'package:tugas_sharepref_localdb/add_todo_screen.dart';

import 'models/boxes.dart';

class MainPage2 extends StatefulWidget {
  @override
  _MainPage2State createState() => _MainPage2State(); }

class _MainPage2State extends State<MainPage2> {
  //TextEditingController _idController = TextEditingController();

  //Box<TodoModel> localDB = Hive.box<TodoModel>("contact_list");

  late SharedPreferences logindata;
  late String username;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true, itemCount: 6, itemBuilder: (context, index){
              return Dismissible(
                  background: Container(
                  color: Colors.red,
                  ),
              key: UniqueKey(),
              onDismissed: (direction){
              },
              child: ListTile(
                title: Text('item'),
                subtitle: Text('amount'),
              ),
              );},),
            RaisedButton(
              onPressed: () {
                logindata.setBool('login', true);
                Navigator.pushReplacement(context,
                    new MaterialPageRoute(builder: (context) => MyLoginPage())); },
              child: Text('LOG OUT'), )
          ],
        ),),

      floatingActionButton: FloatingActionButton( tooltip: 'Add Item',
      child: Icon(Icons.add),
          onPressed: ()=>{ Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context)=> AddTodoScreen(),
          ))
    },),);}

  @override
  void dispose(){
    Hive.close();
    super.dispose(); }
}