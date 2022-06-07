import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/boxes.dart';
import '../models/todo.dart';

class AddTodoScreen extends StatefulWidget {
  AddTodoScreen({Key? key}) : super(key: key);

  @override
  _AddTodoScreenState createState() =>
      _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  validated() {
    if (_formKey.currentState != null &&
        _formKey.currentState!.validate()) {
      _onFormSubmit();
      print("Form Validated");
    } else {
      print("Form not validated");
      return;
    } }

  late String item;
  late String amount;

  void _onFormSubmit(){
    Box<Todo> todoBox = Hive.box<Todo>(HiveBoxex.todo);
    todoBox.add(Todo(item: item, amount: amount));
    Navigator.of(context).pop();
    print(todoBox);}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Shopper'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(labelText: 'Item'),
                    validator: (String? value) {
                      if (value == null || value.trim().length == 0) {
                        return "Required";
                      }
                      return null;
                    },
                    onChanged: (value){
                      item = value;
                    },
                  ),
                  TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(labelText: 'Amount'),
                    validator: (String? value) {
                      if (value == null || value.trim().length == 0) {
                        return "Required";
                      }
                      return null;
                    },
                    onChanged: (value){
                      amount = value;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        validated();
                      },
                      child: Text('Add To Buy'))
                ],),
            )),
      ),);
  }}