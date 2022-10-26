// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, non_constant_identifier_names, import_of_legacy_library_into_null_safe, unused_local_variable

import 'package:flutter/material.dart';
import 'package:shop/modules/archive_tasks/ArchiveTasks_Screen.dart';
import 'package:shop/modules/done_tasks/DoneTasks_Screen.dart';
import 'package:shop/modules/new_tasks/NewTasks_Screen.dart';
import 'package:sqflite/sqflite.dart';
class HomeLatout extends StatefulWidget {
  const HomeLatout({super.key});

  @override
  State<HomeLatout> createState() => _HomeLatoutState();
}

class _HomeLatoutState extends State<HomeLatout> {
  int currentIndex=0;
  List<Widget> Screen=[
    NewTasksScreen(),
    DoneTaskScreen(),
    ArchiveTaskScreen(),
  ];
  List <String> titles=[
    'NewTasks',
    'DoneTasks',
    'archived'
  ];
 @override
  void initState() {
    super.initState();
    createDatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex]),

      ),
      body: Screen[currentIndex],
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {
          
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex=index;
          });
          print(index);
        },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.menu),label: 'tasks'),
        BottomNavigationBarItem(icon: Icon(Icons.check),label: 'Done'),
        BottomNavigationBarItem(icon: Icon(Icons.archive),label: 'Archived'),

      ]),
    );
  }

    Future<void> createDatabase() async {
      var database= await openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database, version)
         {
          print('db create');
          database.execute('CREATE TABLE tasks(id INTGER PRIMARY KEY,title TEXT,date TEXT)').then((value) {
            print('table created');
          }).catchError((error){
            print('error when catch table ${error.toString()}');
          });
        } ,
        onOpen: (database)  {
          print('db open');
        },
      );
    }
   
   
    void insertDatabase()
    {

    }

}
