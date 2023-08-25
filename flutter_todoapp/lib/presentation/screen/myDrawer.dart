// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../main.dart';

import '../bloc/tasks_bloc/bloc/tasks_bloc.dart';
import '../res/color.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              color: SecondaryColor,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Task Drawer',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: WHITE,
                      fontWeight: FontWeight.w400,
                      fontSize: 25),
                ),
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('bottomnavigationbarr');
                },
                child: ListTile(
                  leading: Icon(Icons.folder_special, color: SecondaryColor),
                  title: Text(
                    'My Tasks',
                    style: TextStyle(color: GREY, fontWeight: FontWeight.bold),
                  ),
                  trailing: Text('${state.pendingTasks.length} | ${state.completedTasks.length}',
                      style: TextStyle(color: GREY)),
                ),
              );
            }),
            Divider(),
            BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('recylebin');
                },
                child: ListTile(
                  leading: Icon(
                    Icons.delete,
                    color: SecondaryColor,
                  ),
                  title: Text('Bin',
                      style:
                          TextStyle(color: GREY, fontWeight: FontWeight.bold)),
                  trailing: Text('${state.removedTasks.length}',
                      style: TextStyle(color: GREY)),
                ),
              );
            }),
            Switch(
                inactiveTrackColor: GREY.withOpacity(0.4),
                inactiveThumbColor: SecondaryColor.withAlpha(120),
                activeColor: SecondaryColor,
                value:themeManger.themeMode==ThemeMode.dark,
                onChanged: (newvalue) {
                 themeManger.toogleTheme(newvalue);
                    // newvalue?context.read()<SwitchBloc>().add(SwitchOnEvent()):
                    // context.read()<SwitchBloc>().add(SwitchOffEvent());
              
                })
          ],
        ),
      ),
    );
  }
}
