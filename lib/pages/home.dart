import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_with_hive/data/database.dart';
import 'package:to_do_with_hive/utils/alertBox.dart';
import 'package:to_do_with_hive/utils/to_do_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();
  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }

  TextEditingController _filed = TextEditingController();
  void showDialogBox() {
    showDialog(
        context: context,
        builder: (context) {
          return ShowDialogBox(
            filed: _filed,
            onCancel: () {
              Navigator.of(context).pop();
            },
            onSave: () {
              setState(() {
                db.toDoList.add([_filed.text, false]);
                _filed.clear();
              });
              Navigator.of(context).pop();
              db.updateDataBase();
            },
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.remove(db.toDoList[index]);
    });
    db.updateDataBase();
  }

  void checkBoxChanges(int index, bool value) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('To Do'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialogBox();
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.yellow[200],
      body: Container(
          child: ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (BuildContext context, index) {
                return ToDoTile(
                  taskName: db.toDoList[index][0],
                  value: db.toDoList[index][1],
                  onChanged: (value) {
                    checkBoxChanges(index, value!);
                    db.updateDataBase();
                  },
                  deleteFunction: (context) {
                    deleteTask(index.toInt());
                  },
                );
              })),
    );
  }
}
