import 'package:hive_flutter/adapters.dart';
import 'package:todo_using_bloc/hive/hive_textcases.dart';
import 'package:todo_using_bloc/models/todo_model.dart';

class HiveImplementation implements HiveTodoTestCases {
  static late Box<Todo> _box;

  @override
  Future<void> init() async {
    Hive.initFlutter();
    Hive.registerAdapter(TodoAdapter());
    _box = await Hive.openBox<Todo>('tasks');
  }

  @override
  Future<bool> add(Todo task, int id) async {
    try {
      await _box.put(id, task);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> delete(int id) async {
    try {
      await _box.delete(id);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteAll() async {
    try {
      await _box.clear();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  List<Todo> getAllTodos() {
    final List<Todo> tasks = _box.values.toList();
    tasks.sort((a, b) => a.time.compareTo(b.time));
    return tasks;
  }
}
