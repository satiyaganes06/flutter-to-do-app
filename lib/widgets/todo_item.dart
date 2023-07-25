import 'package:flutter/material.dart';
import 'package:todoapp/colors.dart';
import 'package:todoapp/model/model.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  const ToDoItem(
      {Key? key,
      required this.todo,
      required this.onToDoChanged,
      required this.onDeleteItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          onTap: () {
            onToDoChanged(todo);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: Colors.white,
          leading: todo.isDone!
              ? Icon(
                  Icons.check_box,
                  color: tdblue,
                )
              : Icon(
                  Icons.check_box_outline_blank,
                  color: tdblue,
                ),
          title: Text(
            todo.toDoText.toString(),
            style: TextStyle(
                color: tdblack,
                decoration: todo.isDone! ? TextDecoration.lineThrough : null),
          ),
          trailing: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: tdRed, borderRadius: BorderRadius.circular(8)),
            child: IconButton(
                onPressed: () {
                  onDeleteItem(todo.id);
                },
                color: Colors.white,
                iconSize: 18,
                icon: Icon(Icons.delete)),
          ),
        ),
      ),
    );
  }
}
