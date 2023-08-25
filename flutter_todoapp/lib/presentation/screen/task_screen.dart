// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/task.dart';
import '../bloc/tasks_bloc/bloc/tasks_bloc.dart';
import '../res/color.dart';
import '../widget/tasks_list.dart';
import 'addTask.dart';
import 'myDrawer.dart';
// ignore: must_be_immutable
class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}
class _TaskScreenState extends State<TaskScreen> {
  TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.pendingTasks;
        return Scaffold(         
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(20.0),
            child: IconButton(
              icon: Icon(
                Icons.add_circle_outline,
                color: SecondaryColor,
                size: 50,
              ),
              onPressed: () {
                _addTask(context);
              },
            ),
          ),
          drawer: MyDrawer(),
          appBar: AppBar(
              backgroundColor: SecondaryColor,
              title: Text(
                ' My Tasks',
                style: TextStyle(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      _addTask(context);
                    },
                    icon: Icon(Icons.add))
              ]),
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Chip(backgroundColor: SecondaryColor.withOpacity(0.7),
                label: Text('${state.pendingTasks.length} Pending | ${state.completedTasks.length} Completed ',
                style: TextStyle(color: WHITE,fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),)),
              ),
            ),
            TasksList(taskList: taskList),
          ]),
        );
      },
    );
  }
}
void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ));
  }