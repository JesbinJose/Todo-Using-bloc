part of 'todo_bloc.dart';

sealed class TodoState {
  final List<Todo> todos;
  TodoState(this.todos);
}

final class TodoInitialState extends TodoState {
  TodoInitialState(super.todos);
}

final class TodoUpdatedState extends TodoState{
  TodoUpdatedState(super.todos);
}
