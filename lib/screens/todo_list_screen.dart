import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tugas_sharepref_localdb/models/boxes.dart';
import 'package:tugas_sharepref_localdb/models/todo.dart';
import 'package:tugas_sharepref_localdb/screens/add_todo_screen.dart';
import 'add_todo_screen.dart';

class TodoListScreen extends StatefulWidget {
  final String title;
  const TodoListScreen({Key? key, required this.title}) :
        super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  get item => null;
  get amount => null;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable:
            Hive.box<Todo>(HiveBoxex.todo).listenable(),
            builder: (context, Box<Todo> box, _){
              if(box.values.isEmpty){
                return Center(
                  child: Text('Data Unavailable'),
                );
              }
              return ListView.builder(
                itemCount: box.values.length,
                itemBuilder: (context, index){
                  Todo? res = box.getAt(index);
                  return Dismissible(
                    background: Container(
                      color: Colors.red,
                    ),
                    key: UniqueKey(),
                    onDismissed: (direction){
                      res!.delete();
                    },
                    child: ListTile(
                      title: Text(res!.item),
                      subtitle: Text(res!.amount),
                    ),
                  );
                },);}
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add To Buy',
          child: Icon(Icons.add),
          onPressed: ()=>{
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> AddTodoScreen(),
                ))
          },)
    );
  }
  void dispose(){
    Hive.close();
    super.dispose();
  }
}