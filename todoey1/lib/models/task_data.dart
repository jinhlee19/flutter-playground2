import 'package:flutter/foundation.dart';
import 'package:todoey1/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'buy milk'),
    Task(name: 'buy eggs'),
    Task(name: 'buy bread'),
  ];
}
