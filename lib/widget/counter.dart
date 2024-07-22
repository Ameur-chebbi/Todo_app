// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class counter extends StatelessWidget {
  final int completed;
  final int todos;
  const counter({Key? key, required this.completed, required this.todos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 25),
      child: Text(
        " $completed/$todos",
        style: TextStyle(
            fontSize: 30,
            color: completed == todos ? Colors.green : Colors.white,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
