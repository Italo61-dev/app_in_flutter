import 'package:first_project/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    Task(
      nome: 'Aprender Flutter.',
      img: 'assets/images/flutter.png',
      dificuldade: 4,
    ),
    Task(
      nome: 'Ler um livro.',
      img: 'assets/images/book.jpg',
      dificuldade: 5,
    ),
    Task(
      nome: 'Musculação',
      img: 'assets/images/bodybuilder.jpg',
      dificuldade: 2,
    ),
  ];

  void newTask(String name, String photo, int difficulty){
    taskList.add(Task(nome: name, img: photo, dificuldade: difficulty,),);
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
