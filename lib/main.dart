// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_3/widget/counter.dart';
import 'package:flutter_application_3/widget/todo_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class Task {
  String title;
  bool status;
  Task({required this.title, required this.status});
}

class _TodoAppState extends State<TodoApp> {
  List alltasks = [
    Task(title: "Codding", status: true),
    Task(title: "Gaming", status: false),
    Task(title: "Call mom", status: true),
    Task(title: " gem", status: false),
  ];
  delete(ind) {
    setState(() {
      alltasks.remove(alltasks[ind]);
    });
  }

  deleteall() {
    setState(() {
      alltasks.removeRange(0, alltasks.length);
    });
  }

  changestatu(int taslkindx) {
    setState(() {
      alltasks[taslkindx].status = !alltasks[taslkindx].status;
    });
  }

  addnewtask() {
    setState(() {
      alltasks.add(
        Task(title: myController.text, status: false),
      );
    });
  }
// create controller to get the text in the textfeild
  final myController = TextEditingController();
// to calcle number of tasks
  int calculate() {
    int number = 0;
    alltasks.forEach((item) {
      if (item.status == true) {
        number++;
      }
    });

    return number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext contex) {
            // dialog    taaml byha box ktiba 
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                      padding: EdgeInsets.all(25),
                      color: Colors.white,
                      height: 170,
                      child: Column(
                        children: [
                          TextField(
                            controller: myController,
                            maxLength: 20,
                            decoration:
                                InputDecoration(hintText: "Add new task"),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextButton(
                            onPressed: () {
                              addnewtask();
                              Navigator.pop(context);
                            },
                            child: Text(
                              "ADD",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ],
                      )),
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.white12,
      ),
      backgroundColor: Color.fromRGBO(29, 32, 40, 0.933),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              deleteall();
            },
            icon: Icon(Icons.delete_forever),
            iconSize: 37,
            color: Colors.red,
          )
        ],
        elevation: 0,
        backgroundColor: Color.fromRGBO(34, 40, 50, 0.929),
        title: Text(
          "TO DO LIST",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            counter(
              completed: calculate(),
              todos: alltasks.length,
            ),
            Container(
              height: 550,
              child: ListView.builder(
                  itemCount: alltasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TodoCard(
                      vartittle: alltasks[index].title,
                      Donnt: alltasks[index].status,
                      myfunc: changestatu,
                      ind: index,
                      delete: delete,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
