import 'package:flutter/material.dart';


import '../../data/models/task.dart';

import '../res/color.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    super.key, required this.cancelOrDeleteCallback, required this.task, 
    required this.likeOrDislike, required this.editTaskCallback, required this.restorTaskCallback, 
  });
final VoidCallback cancelOrDeleteCallback;
final VoidCallback likeOrDislike;
final VoidCallback editTaskCallback;
final VoidCallback restorTaskCallback;
final Task task;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
     itemBuilder:task.isDeleted==false? ( (context)=>[
      //for edit
       PopupMenuItem(
       onTap:editTaskCallback ,
         child: 
       TextButton.icon(onPressed: (){
        editTaskCallback;
       },
       icon:const Icon(Icons.edit,color:SecondaryColor) ,
       label: const Text('Edit',style: TextStyle(color:GREY,fontWeight: FontWeight.bold),),)),
        
        //for bookmarker
        PopupMenuItem(
          
       
         child: 
       TextButton.icon(onPressed: (){
        likeOrDislike;
       },
       icon:task.isFavorite==false
       ? const Icon(Icons.bookmark_add_outlined,color:SecondaryColor)
       : const Icon(Icons.bookmark_remove,color:SecondaryColor),
       label:  task.isFavorite==false
       ? const Text('Add to \nBookmarks',
       style: TextStyle(color:GREY,fontWeight: FontWeight.bold))
       :const Text('Reomve from \nBookmarks',
       style: TextStyle(color:GREY,fontWeight: FontWeight.bold)),
       )),

       //for delete
        PopupMenuItem(
         onTap: cancelOrDeleteCallback,
        child: 
       TextButton.icon(onPressed:(){} ,
       icon:const Icon(Icons.delete,color:SecondaryColor) ,
       label: const Text('Delete'
       ,style: TextStyle(color:GREY,fontWeight: FontWeight.bold)),)),
       
       ]
       ):(context)=>[ 
        
        //for restore
        PopupMenuItem(
         onTap: restorTaskCallback,
        child: 
       TextButton.icon(onPressed:(){
       } ,
       icon:const Icon(Icons.restore_from_trash,color:SecondaryColor) ,
       label: const Text('Restore'
       ,style: TextStyle(color:GREY,fontWeight: FontWeight.bold)),)),

       //for delete forever
       PopupMenuItem(
         onTap: cancelOrDeleteCallback,
        child: 
       TextButton.icon(onPressed:(){} ,
       icon:const Icon(Icons.delete_forever,color:SecondaryColor) ,
       label: const Text('Delete Forever'
       ,style: TextStyle(color:GREY,fontWeight: FontWeight.bold)),))
       ]
       );
  }
}