part of 'todo_bloc.dart';

@immutable
class TodoState extends Equatable{
  List<TodoModel> todoModel = [];
  TodoState({this.todoModel = const <TodoModel>[]});
  @override
  // TODO: implement props
  List<Object?> get props => [todoModel];
}

// class TodoInitial extends TodoState {
//   @override
//   // TODO: implement props
//   List<Object?> get props =>[];
// }
//
// class AddTask extends TodoState{
//   List<TodoModel> todoList = [];
//   AddTask(this.todoList);
//   @override
//   // TODO: implement props
//   List<Object?> get props => [todoList];
// }
