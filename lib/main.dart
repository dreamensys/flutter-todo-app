import './widgets/new_todo.dart';

import './models/todo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'To Do Manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  List<ToDo> todoList = [
    ToDo(id: DateTime.now().toString(), task: 'make dishes', done: false),
    ToDo(id: DateTime.now().toString(), task: 'prepare for classes', done: false),
  ];

  List<ToDo> get pendingToDoList {
    return todoList.where((element) => !element.done).toList();
  }

  void _saveToDo(String tsk){
    setState(() {
      todoList.add(ToDo(id:DateTime.now().toString(), task: tsk, done: false));
    });
  }

  void _addToDo(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx, 
      builder: (_){
        return GestureDetector(
          onTap: () {},
          child: NewToDo(_saveToDo),
          behavior: HitTestBehavior.opaque,
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: pendingToDoList.length > 0 ? ListView.builder(
        itemBuilder: (BuildContext context, int index){
         return CheckboxListTile(
            value: pendingToDoList[index].done, 
            title: Text(pendingToDoList[index].task),
            onChanged: (bool selected){
              setState(() {
                pendingToDoList[index].done = selected;
              });
            },);
      },
      itemCount: pendingToDoList.length,
      )
      : Center(
        child:Text('No pending tasks, other than loving Camila <3')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addToDo(context),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
