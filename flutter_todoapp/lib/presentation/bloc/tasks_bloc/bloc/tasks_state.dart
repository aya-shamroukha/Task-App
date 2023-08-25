// ignore_for_file: public_member_api_docs, sort_constructors_first



part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  // final List<Task> allTasks;
    final List<Task> completedTasks; 
        final List<Task> pendingTasks;  
    final List<Task> favoriteTasks;
  final List<Task> removedTasks;
  const TasksState({this.pendingTasks=const<Task>[],this.removedTasks=const<Task>[],
   this.completedTasks=const<Task>[], this.favoriteTasks=const<Task>[]});
  
  @override
  List<Object> get props => [removedTasks,favoriteTasks,completedTasks,pendingTasks];

 
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'completedTasks': completedTasks.map((x) => x.toMap()).toList(),
      'pendingTasks': pendingTasks.map((x) => x.toMap()).toList(),
      'favoriteTasks': favoriteTasks.map((x) => x.toMap()).toList(),
      'removedTasks': removedTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      completedTasks:
       List<Task>.from((map['completedTasks'] as List<int>).map<Task>((x) => Task.fromMap(x as Map<String,dynamic>),),),
      pendingTasks: 
      List<Task>.from((map['pendingTasks'] as List<int>).map<Task>((x) => Task.fromMap(x as Map<String,dynamic>),),),
      favoriteTasks:
       List<Task>.from((map['favoriteTasks'] as List<int>).map<Task>((x) => Task.fromMap(x as Map<String,dynamic>),),),
      removedTasks: 
      List<Task>.from((map['removedTasks'] as List<int>).map<Task>((x) => Task.fromMap(x as Map<String,dynamic>),),),
    );
  }

 
}

