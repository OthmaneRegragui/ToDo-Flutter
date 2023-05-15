import 'package:flutter/material.dart';
import '../constValues/colors.dart';

class AddTask extends StatelessWidget{
  final Function(String) addTaskItem;
  final TextEditingController taskController;

  const AddTask({super.key,required this.taskController, required this.addTaskItem});

  @override
  Widget build(BuildContext context) {
return                 Align(
  child: Row(children: [
    Expanded(
      child: Container(
        margin: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          right: 10,
          left: 10,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 0.0),
              blurRadius: 10.0,
              spreadRadius: 0.0,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: taskController,
          decoration: const InputDecoration(
              hintText: 'Add a new task',
              border: InputBorder.none),
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.only(
        bottom: 20,
        right: 20,
      ),
      child: ElevatedButton(
        onPressed: () {
          addTaskItem(taskController.text);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: tdGreen,
          minimumSize: const Size(60, 60),
          elevation: 10,
        ),
        child: const Text(
          'Add',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
    ),
  ]),
);
  }

}