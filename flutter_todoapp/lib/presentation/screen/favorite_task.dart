// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/task.dart';
import '../bloc/tasks_bloc/bloc/tasks_bloc.dart';
import '../res/color.dart';
import '../widget/tasks_list.dart';
import 'myDrawer.dart';
class Favorite extends StatelessWidget {
  const Favorite({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc,TasksState>(builder: (context,state){
      List<Task> taskList=state.favoriteTasks;
      return   Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
             backgroundColor: SecondaryColor,
            title: Text('Favorite', style: TextStyle(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),),
           ),
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Chip(backgroundColor: SecondaryColor.withOpacity(0.7),label: Text('${state.favoriteTasks.length} Tasks',
                style: TextStyle(color: WHITE,fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),)),
              ),
            ),
            TasksList(taskList:taskList),
           
          ]),
        );
    });
    
  
  }
}