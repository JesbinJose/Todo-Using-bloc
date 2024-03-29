import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_using_bloc/bloc/todo_bloc.dart';
import 'package:todo_using_bloc/presentation/home/widgets/bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              final task = state.todos[index];
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white.withOpacity(0.1),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ListTile(
                    title: Text(task.name),
                    style: ListTileStyle.list,
                    trailing: IconButton(
                      onPressed: () => context.read<TodoBloc>().add(
                            TodoRemoveEvent(
                              task.time.millisecond,
                            ),
                          ),
                      icon: const Icon(Icons.delete_forever),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            builder: (context) => MyTaskAddBottomSheet(),
            context: context,
          );
        },
      ),
    );
  }
}
