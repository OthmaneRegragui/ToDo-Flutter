import 'package:flutter/material.dart';
import '../constValues/colors.dart';
import '../models/Task.dart';
import 'TaskItem.dart';

class TaskList extends StatelessWidget{
  final List<Task> foundTask;
  final Function(Task) handleTaskChange;
  final Function(String) deleteTaskItem;
  const TaskList({super.key, required this.foundTask, required this.handleTaskChange, required this.deleteTaskItem});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 50,
              bottom: 20,
            ),
            child: const Text(
              'All Tasks',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          for (Task ts in foundTask.reversed)
            TaskItem(
              task: ts,
              onToDoChanged: handleTaskChange,
              onDeleteItem: deleteTaskItem,
            ),
        ],
      ),
    );
  }

}