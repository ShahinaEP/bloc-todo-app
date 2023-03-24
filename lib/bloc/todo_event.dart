part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent extends Equatable{}

class AddTask extends TodoEvent{
  final TodoModel todoModel;
  AddTask({required this.todoModel});
  @override
  // TODO: implement props
  List<Object?> get props => [todoModel];
}

class UpdateTask extends TodoEvent{
  final TodoModel todoModel;
  UpdateTask({required this.todoModel});
  @override
  // TODO: implement props
  List<Object?> get props => [todoModel];
}