// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todoapp/presentation/widget/popupmenu.dart';
import 'package:intl/intl.dart';


import '../../data/models/task.dart';

import '../bloc/tasks_bloc/bloc/tasks_bloc.dart';
import '../res/color.dart';
import '../screen/edit_task.dart';
import 'MysizedBox.dart';

class Task_ListTile extends StatelessWidget {
  const Task_ListTile({
    super.key,
    required this.task,
  });

  final Task task;
   void _removeOrDeleteTask(BuildContext ctx,Task task){
    task.isDeleted!
    ?ctx.read<TasksBloc>().add(DeleteTask(task: task)):
    ctx.read<TasksBloc>().add(RemoveTask(task: task));
       }
       void _editTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: EditTaskScreen(oldTask: task),
              ),
            ));
  }
  @override
  Widget build(BuildContext context) {
    return  Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Expanded(
        child: Row(
          children: [
          task.isFavorite==false
          ?  const Icon(Icons.star_border_outlined,color: SecondaryColor,)
          : const Icon(Icons.star,color: SecondaryColor,),
                  const SizedBox_width(width: 10),
             Expanded(
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(task.title,overflow: TextOverflow.ellipsis,
                       style:TextStyle(color: task.isDone!?SecondaryColor:GREY,fontSize: task.isDone!?20:17)),
                       Text(DateFormat().add_yMMMMd().format(DateTime.parse(task.date)),
                       style: TextStyle(color: GREY.withOpacity(0.8)),)
                 ],
               ),
             ),
          ],
        ),
      ),
        
        Row(
          children: [
            Checkbox(
                  activeColor: SecondaryColor,
                  value: task.isDone,
                  onChanged: task.isDeleted==false? (value) {
                    context.read<TasksBloc>().add(UpdateTask(task: task));
                   }:null
                   ,),
                   PopupMenu(task: task,
                   restorTaskCallback: () => context.read<TasksBloc>().add(RestoreTask(task: task)),
                   editTaskCallback: (){
                    Navigator.of(context).pop();

                    _editTask(context);},
                   cancelOrDeleteCallback: () => _removeOrDeleteTask(context, task),
                    likeOrDislike: () =>context.read<TasksBloc>().add(MarkFavoriteOrUnfavoriteTask(task: task)),
                    )

          ],
        ),

    ],) ;
  }
}


