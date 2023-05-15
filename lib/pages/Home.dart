import 'package:flutter/material.dart';
import 'package:todo_flutter/widgets/AddTask.dart';
import '../models/Task.dart';
import '../constValues/colors.dart';
import '../models/TasksManager.dart';
import '../widgets/SearchBox.dart';
import '../widgets/TasksList.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final tasksList = TasksManager.tasksList();
  List<Task> foundTask= [];
  final taskController = TextEditingController();

  @override
  void initState() {
    foundTask = tasksList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                SearchBox(onSearch: onSearch,),
                AddTask(taskController: taskController, addTaskItem: addTaskItem),
                TaskList(foundTask:foundTask,handleTaskChange:handleTaskChange,deleteTaskItem:deleteTaskItem)
              ],
            ),
          ),

        ],
      ),
    );
  }

  void handleTaskChange(Task ts) {
    setState(() {
      ts.isDone = !ts.isDone;
    });
  }

  void deleteTaskItem(String id) {
    setState(() {
      tasksList.removeWhere((item) => item.id == id);
    });
  }

  void addTaskItem(String toDo) {
    setState(() {
      tasksList.add(Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    taskController.clear();
  }

  void onSearch(String enteredKeyword) {
    List<Task> results = [];
    if (enteredKeyword.isEmpty) {
      results = tasksList;
    } else {
      results = tasksList
          .where((item) => item.todoText!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundTask = results;
    });
  }

}