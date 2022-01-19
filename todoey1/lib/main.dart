import 'package:flutter/material.dart';
import 'package:todoey1/models/task_data.dart';
import 'package:todoey1/screen/tasks_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Todo Check ! builder => create로 바뀜
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
