import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            CircleAvatar(
              child: Icon(
                Icons.list,
                size: 30,
                color: Colors.lightBlueAccent,
              ),
              backgroundColor: Colors.white,
              radius: 30,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Todoey',
              style: TextStyle(
                color: Colors.white,
                fontSize: 45.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '12 Tastks',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const Container(
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: 20,
                  topRight: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
