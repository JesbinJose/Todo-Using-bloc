import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_using_bloc/bloc/todo_bloc.dart';

class MyTaskAddBottomSheet extends StatelessWidget {
  MyTaskAddBottomSheet({super.key});
  final TextEditingController _task = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  controller: _task,
                  validator: (value) {
                    if (value?.isNotEmpty != true) return 'Its is empty';
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<TodoBloc>().add(TodoAddEvent(_task.text));
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Task added to Todo'),
                        duration: const Duration(milliseconds: 1500),
                        width: 280.0,
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: const Text('Add Task'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
