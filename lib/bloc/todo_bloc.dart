import 'package:bloc/bloc.dart';
import 'package:todo_using_bloc/hive/hive.dart';
import 'package:todo_using_bloc/models/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitialState(HiveImplementation().getAllTodos())) {
    on<TodoAddEvent>((event, emit) async {
      final Todo todo = Todo(name: event.data, time: DateTime.now());
      await HiveImplementation().add(todo, todo.time.millisecond);
      emit(TodoUpdatedState([...state.todos, todo]));
    });
    on<TodoRemoveEvent>((event, emit) async {
      for (Todo e in state.todos) {
        if (e.time.millisecond == event.id) {
          state.todos.remove(e);
        }
      }
      await HiveImplementation().delete(event.id);
      emit(TodoUpdatedState([...state.todos]));
    });
  }
}
