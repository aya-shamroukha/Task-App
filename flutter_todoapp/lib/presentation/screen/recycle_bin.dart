// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/tasks_bloc/bloc/tasks_bloc.dart';
import '../res/color.dart';
import '../widget/tasks_list.dart';
import 'myDrawer.dart';


class RecyleBin extends StatelessWidget {
  const RecyleBin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc,TasksState>(builder: (context,state){
      return   Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
             backgroundColor: SecondaryColor,
             actions: [
              PopupMenuButton(itemBuilder: (context)=>[
                PopupMenuItem(
                  onTap: () => context.read<TasksBloc>().add(DeleteAllTask()),
                  child: 
                TextButton.icon(onPressed: (){}, 
                icon: Icon(Icons.delete_forever,color: SecondaryColor,),
                 label: Text('Delete all tasks',style:
                          TextStyle(color: GREY, fontWeight: FontWeight.bold))))
              ])
             ],
            title: Text('Recyle Bin', style: TextStyle(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),),
           ),
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Chip(backgroundColor: SecondaryColor.withOpacity(0.7),label: Text('${state.removedTasks.length} Tasks',
                style: TextStyle(color: WHITE,fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),)),
              ),
            ),
            TasksList(taskList:state.removedTasks),
           
          ]),
        );
    });
    
  
  }
}