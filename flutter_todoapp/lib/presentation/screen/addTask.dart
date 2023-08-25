 // ignore_for_file: prefer_const_constructors, file_names

 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/task.dart';
import '../bloc/tasks_bloc/bloc/tasks_bloc.dart';
import '../res/color.dart';
import '../res/guid_gen.dart';
import '../widget/taextfeild.dart';


class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
        TextEditingController titleController=TextEditingController();
        TextEditingController descriptioncontroller=TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(top:10,bottom: 20),
      child: Column(
        children: [
          Image.asset('images/Rectangle 3.png'),
          SizedBox(height: 5,),
        Text("Add Task",style: TextStyle(fontSize: 20,color: SecondaryColor,
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: MyTextField(Controller: titleController,labelText: 'Add Task'),
         
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: MyTextField(Controller: descriptioncontroller,labelText: 'Description'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(onPressed: (){Navigator.pop(context);},
             child: Text("Cancel",style:TextStyle(fontSize: 20,color: GREY,
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),)),
             ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(SecondaryColor)),
              onPressed: (){
          var task=Task(description: descriptioncontroller.text,
          date: DateTime.now().toString(),
          title: titleController.text,
          id: GUIDGen.generate());
           context.read<TasksBloc>().add(AddTask(task: task));
           Navigator.pop(context);
        }, child: Text("Add",style: TextStyle(fontSize: 17,color: WHITE,fontStyle: FontStyle.italic, fontWeight: FontWeight.w400)))
          ],
        ),
       
      ]),
    );
  }
}

