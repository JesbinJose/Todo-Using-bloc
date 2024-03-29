import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 1)
class Todo extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final DateTime time;
  Todo({
    required this.name,
    required this.time,
  });
}
