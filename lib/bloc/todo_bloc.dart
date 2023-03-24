import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../models/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<RemoveTask>(_onRemoveTask);
  }

  void _onAddTask(AddTask event, Emitter<TodoState> emit){
    final state = this.state;
    emit(
      TodoState(todoModel: List.from(state.todoModel)..add(event.todoModel))
    );
  }

  void _onUpdateTask(UpdateTask event, Emitter<TodoState> emit){
    final state = this.state;

    emit(
        TodoState(todoModel: List.from(state.todoModel)..remove(event.todoModel))
    );
  }

  void _onRemoveTask(RemoveTask event, Emitter<TodoState> emit){
    final state = this.state;

    emit(
        TodoState(todoModel: List.from(state.todoModel)..remove(event.todoModel))
    );
  }

}


