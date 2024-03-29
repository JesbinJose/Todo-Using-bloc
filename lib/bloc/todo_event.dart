part of 'todo_bloc.dart';

sealed class TodoEvent {}

final class TodoAddEvent extends TodoEvent {
  final String data;
  TodoAddEvent(this.data);
}

final class TodoRemoveEvent extends TodoEvent {
  final int id;
  TodoRemoveEvent(this.id);
}

final class TodoRemoveAllEvent extends TodoEvent {}
