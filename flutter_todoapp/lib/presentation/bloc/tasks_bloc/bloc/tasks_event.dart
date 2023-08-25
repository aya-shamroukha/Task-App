// ignore_for_file: prefer_const_constructors_in_immutables

part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}
class AddTask extends TasksEvent{
  final Task task;

  AddTask({required this.task});
   @override
  List<Object> get props => [task];
}
class UpdateTask extends TasksEvent{
  final Task task;

  UpdateTask({required this.task});
   @override
  List<Object> get props => [task];
}
class DeleteTask extends TasksEvent{
  final Task task;

  DeleteTask({required this.task});
   @override
  List<Object> get props => [task];
}
class RemoveTask extends TasksEvent{
  final Task task;

  RemoveTask({required this.task});
   @override
  List<Object> get props => [task];
}
class MarkFavoriteOrUnfavoriteTask extends TasksEvent{
  final Task task;

  MarkFavoriteOrUnfavoriteTask({required this.task});
   @override
  List<Object> get props => [task];
}
class EditTask extends TasksEvent{
  final Task oldTask;
  final Task newTask;
  const EditTask({required this.oldTask,required this.newTask});
   @override
  List<Object> get props => [oldTask,newTask];
}
class RestoreTask extends TasksEvent{
  final Task task;
  RestoreTask({required this.task});
   @override
  List<Object> get props => [task];
}

class DeleteAllTask extends TasksEvent{}
