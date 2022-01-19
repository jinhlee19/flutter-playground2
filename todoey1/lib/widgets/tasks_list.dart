import 'package:flutter/material.dart';
import 'package:todoey1/models/task_data.dart';
import 'package:todoey1/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            taskTitle: Provider.of<TaskData>(context).tasks[index].name,
            isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
            checkboxCallback: (bool? checkboxState) {
              // setState(() {
              //   widget.tasks[index].toggleDone();
              // });
            });
      },
      itemCount: Provider.of<TaskData>(context).tasks.length,
    );
  }
}
