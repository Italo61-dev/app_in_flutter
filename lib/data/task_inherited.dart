import 'package:first_project/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
   TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final  List<Task> taskList = [
    Task(name: 'Codar', image: 'assets/images/flutter.png', difficulty: 3),
    Task(name: 'Ler livro', image: 'assets/images/book.jpg', difficulty: 3),
    Task(name: 'Academia', image: 'assets/images/bodybuilder.jpg', difficulty: 2),

  ];

  void newTask(String nameNew, int difficultyNew, String imageNew){
    taskList.add(Task(name: nameNew, difficulty: difficultyNew, image: imageNew));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  //Fica de olho no estado anterior
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
