
import 'package:flutter/material.dart';
import 'package:flutter_todoapp/presentation/widget/tasks_listtile.dart';


import '../../data/models/task.dart';
import '../res/color.dart';


class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList.map((task) =>ExpansionPanelRadio(
            value: task.id,
             headerBuilder: (context, isOpen) => Task_ListTile(task: task),
              body:  ListTile(
                title: SelectableText.rich(TextSpan(children: [
                    const TextSpan(text: 
                    'Task Name:\n',style: TextStyle(
                      fontWeight: FontWeight.bold,color: SecondaryColor
                    )),
                    TextSpan(text: task.title,
                    style: const TextStyle(color: GREY,fontWeight: FontWeight.w500)),
                    
                     const TextSpan(text: 
                    '\n\n Description:\n',style: TextStyle(
                      fontWeight: FontWeight.bold,color: SecondaryColor
                    )),
                    TextSpan(text: task.description,
                    style: const TextStyle(color: GREY,fontWeight: FontWeight.w500)),
                    
                ])
                ),
              )
              ) ).toList(),
        ),
      ),
    );
  }
}

//  Expanded(
//       child: ListView.builder(
//         itemCount: taskList.length,
//         itemBuilder: (context,index){
//          var task=taskList[index];
//           return Padding(
//             padding: const EdgeInsets.all(20),
//             child: Task_ListTile(task: task),
//           );
//         }),
//     );