import 'package:flutter/material.dart';
import 'package:todoapp/colors.dart';
import 'package:todoapp/model/model.dart';
import 'package:todoapp/widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todoList = ToDo.todolist();
  final toDoController = TextEditingController();
  List<ToDo> foundList = [];

  @override
  void initState() {
    foundList = todoList;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBG,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tdBG,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: tdblack,
              size: 30,
            ),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                      'https://img.freepik.com/premium-vector/young-smiling-man-avatar-man-with-brown-beard-mustache-hair-wearing-yellow-sweater-sweatshirt-3d-vector-people-character-illustration-cartoon-minimal-style_365941-860.jpg')),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Column(children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    onChanged: (value) => runFilter(value),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: tdblack,
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(color: tdblack),
                        border: InputBorder.none),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 30),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'All ToDo',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: tdblack),
                          ),
                        ),
                      ),
                    ),
                    for (ToDo todoo in foundList.reversed)
                      ToDoItem(
                        todo: todoo,
                        onToDoChanged: handleToDoChange,
                        onDeleteItem: onDeleteitem,
                      )
                  ],
                ),
              ),
            ]),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 0.0),
                              spreadRadius: 0.0,
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: toDoController,
                          decoration: InputDecoration(
                            hintText: 'Add new Item',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 20),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: tdblue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                          onPressed: () {
                            addItems(toDoController.text);
                          },
                          icon: Icon(
                            Icons.add,
                            color: tdBG,
                          )),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  void handleToDoChange(ToDo toDo) {
    setState(() {
      toDo.isDone = !toDo.isDone;
    });
  }

  void onDeleteitem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void addItems(String toDo) {
    setState(() {
      todoList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          toDoText: toDo));
    });
    toDoController.clear();
  }

  void runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where((item) => item.toDoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundList = results;
    });
  }
}
