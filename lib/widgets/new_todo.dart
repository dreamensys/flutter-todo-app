import 'package:flutter/material.dart';

class NewToDo extends StatefulWidget {
  final Function addToDo;

  NewToDo(this.addToDo);

  @override
  _NewToDoState createState() => _NewToDoState();
}

class _NewToDoState extends State<NewToDo> {
  final _taskController = TextEditingController();

  void _saveToDo(){
    String task = _taskController.text;
    widget.addToDo(task);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child:Container(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Task'),
              controller:_taskController
            ),
            RaisedButton(
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white),
                ),
              color: Theme.of(context).primaryColor,
              onPressed: _saveToDo
            ),
          ],
        ),
      ),
    );
  }
}