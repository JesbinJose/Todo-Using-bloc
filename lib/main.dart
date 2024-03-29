import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_using_bloc/bloc/todo_bloc.dart';
import 'package:todo_using_bloc/hive/hive.dart';
import 'package:todo_using_bloc/presentation/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveImplementation().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(),
      child: MaterialApp(
        title: 'Todo app',
        theme: ThemeData.dark(),
        home: const HomeScreen(),
      ),
    );
  }
}
