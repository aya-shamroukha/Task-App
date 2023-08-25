
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../data/models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    //add event
    on<AddTask>((event, emit) {
      emit(TasksState(
        pendingTasks: List.from(state.pendingTasks)..add(event.task),
        removedTasks: state.removedTasks,
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks
      ));
    });
    //update event
    on<UpdateTask>((event, emit){
       List<Task> pendingTasks=state.pendingTasks;
       List<Task> favoriteTasks=state.favoriteTasks;
       List<Task> completedTasks=state.completedTasks;
       if(event.task.isDone==false){
        if(event.task.isFavorite==false){
             pendingTasks=List.from(pendingTasks)..remove(event.task);
       completedTasks=List.from(completedTasks)..insert(0, event.task.copyWith(isDone: true));
        }else{
          var taskIndex=favoriteTasks.indexOf(event.task);
          pendingTasks=List.from(pendingTasks)..remove(event.task);
          completedTasks.insert(0, event.task.copyWith(isDone: true));
          favoriteTasks=List.from(favoriteTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isDone: true));
        }
       }else{
        if(event.task.isFavorite==true){
          completedTasks=List.from(completedTasks)..remove(event.task);
          pendingTasks=List.from(pendingTasks)
          ..insert(0, event.task.copyWith(isDone: false));
        }else{
          var taskIndex=favoriteTasks.indexOf(event.task);
  completedTasks=List.from(completedTasks)..remove(event.task);
          pendingTasks=List.from(pendingTasks)..insert(0, event.task.copyWith(isDone: false));
          favoriteTasks=List.from(favoriteTasks)..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isDone: false));
        }
       }
       
       emit(TasksState(
       completedTasks: completedTasks,
       favoriteTasks:state.favoriteTasks,

       pendingTasks: pendingTasks,
       removedTasks: state.removedTasks
       ));

    });

    //favorite event
    on<MarkFavoriteOrUnfavoriteTask>((event, emit) {
        List<Task> pendingTasks= state.pendingTasks;
       List<Task> completedTasks= state.completedTasks;
       List<Task> favoriteTasks= state.favoriteTasks;
         if(event.task.isDone==false){
           if(event.task.isFavorite==false){
            var taskIndex=pendingTasks.indexOf(event.task);
            pendingTasks=List.from(pendingTasks)
            ..remove(event.task)
            ..insert(taskIndex, event.task.copyWith(isFavorite: true));
            favoriteTasks.insert(0, event.task.copyWith(isFavorite: true));

           }else{
            var taskIndex=pendingTasks.indexOf(event.task);
            pendingTasks=List.from(pendingTasks)
            ..remove(event.task)
            ..insert(taskIndex, event.task.copyWith(isFavorite: false));
            favoriteTasks.remove(event.task);
           }
         }else{
          if(event.task.isFavorite==false){
            var taskIndex=completedTasks.indexOf(event.task);
            completedTasks=List.from(completedTasks)
            ..remove(event.task)
            ..insert(taskIndex, event.task.copyWith(isFavorite: true));
            favoriteTasks.insert(0, event.task.copyWith(isFavorite: true));
          }else{
            var taskIndex=completedTasks.indexOf(event.task);
              completedTasks=List.from(completedTasks)
            ..remove(event.task)
            ..insert(taskIndex, event.task.copyWith(isFavorite: false));
            favoriteTasks.remove(event.task);
          }
         }
        emit(TasksState(
           pendingTasks: pendingTasks,
           completedTasks: completedTasks,
           favoriteTasks: favoriteTasks,
           removedTasks: state.removedTasks,

     
        ));
    });
         
         // Edit event
         on<EditTask>((event, emit) {
          List<Task> favoriteTasks=state.favoriteTasks;
          if(event.oldTask.isFavorite==true){
            favoriteTasks..remove(event.oldTask)..insert(0, event.newTask);
          }
          emit(TasksState(
            pendingTasks: List.from(state.pendingTasks)
            ..remove(event.oldTask)
            ..insert(0, event.newTask),
            completedTasks: state.completedTasks..remove(event.oldTask),
            favoriteTasks: favoriteTasks,
            removedTasks: state.removedTasks
          ));
         });

     //restor event
     on<RestoreTask>((event, emit){

      emit(TasksState(
        removedTasks: List.from(state.removedTasks)..remove(event.task),
        pendingTasks: List.from(state.pendingTasks)..insert(0, event.task.copyWith(
          isDeleted: false,
          isDone: false,
          isFavorite: false,
        )),
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks
      ));
     });

    //delete all event
    on<DeleteAllTask>((event, emit) {

      emit(TasksState(
        removedTasks: List.from(state.removedTasks)..clear(),
        pendingTasks: state.pendingTasks,
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks
      ));
    });




    //delete event
    on<DeleteTask>((event, emit){

      emit(TasksState(
            completedTasks: state.completedTasks,
        pendingTasks: state.pendingTasks,
        favoriteTasks: state.favoriteTasks,    
        removedTasks: List.from(state.removedTasks)..remove(event.task)
      ));
    });
    //remove event
     on<RemoveTask>((event, emit){
      emit(TasksState(
    
        pendingTasks: List.from(state.pendingTasks)..remove(event.task),
             favoriteTasks: List.from(state.favoriteTasks)..remove(event.task),
                  completedTasks: List.from(state.completedTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)..add(event.task.copyWith(isDeleted: true))
      ));
    });

  }
  


  @override
  TasksState? fromJson(Map<String, dynamic> json) {
  return TasksState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
