import 'package:todo_using_bloc/models/todo_model.dart';

abstract class HiveTodoTestCases {
  Future<void> init();
  Future<bool> add(Todo task,int id);
  Future<bool> delete(int id);
  List<Todo> getAllTodos();
  Future<bool> deleteAll();
}
