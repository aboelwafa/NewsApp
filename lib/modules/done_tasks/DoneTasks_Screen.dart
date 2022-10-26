// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class DoneTaskScreen extends StatelessWidget {
  const DoneTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'DoneTask',style: TextStyle(
          fontSize: 30.0,
          color: Color.fromARGB(255, 4, 235, 54),
        ),
      ),
    );
  }
}