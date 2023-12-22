import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hivedb/todo.dart';

class AddTodo extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  Box todoBox = Hive.box<Todo>('todo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                    labelText: "ToDo", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (titleController.text != '') {
                        Todo newTodo = Todo(
                          title: titleController.text,
                          isCompleted: false,
                        );
                        todoBox.add(newTodo);
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      "Add ToDo",
                      style: TextStyle(fontSize: 20),
                    )),
              )
            ],
          ),
        ));
  }
}
