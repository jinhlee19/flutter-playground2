import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  // 변수 - 변경될수 있음.
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is a task.',
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckbox(
          checkboxState: isChecked,
          toggleCheckboxState: (bool? checkboxState) {
            setState(() {
              if (checkboxState != null) {
                isChecked = checkboxState;
              } else {
                isChecked = true;
              }
            });
          }),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  //stateless widget 에서는 final -> (1) 빌드 후 값을 변경하지 않음. 변경될시엔 다시시작시켜서 (2) 지우고 리빌드
  final bool checkboxState;
  // final Function toggleCheckboxState;
  final void Function(bool?) toggleCheckboxState;
  // (2) TaskCheckbox 가 실행되면 bool 값을 받아서 widget 이 rebuild 된다.
  const TaskCheckbox(
      {required this.checkboxState, required this.toggleCheckboxState});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged: toggleCheckboxState,
    );
  }
}
