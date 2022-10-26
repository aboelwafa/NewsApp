// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class NewTasksScreen extends StatelessWidget {
  const NewTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'newTask',style: TextStyle(
          fontSize: 30.0,
          color: Colors.blue,
        ),
      ),
    );
  }
}