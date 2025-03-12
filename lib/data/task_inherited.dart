import 'package:flutter/material.dart';
import 'package:first_project/components/task.dart';

class TaskInherited extends StatefulWidget {
  final Widget child;

  const TaskInherited({super.key, required this.child});

  static _TaskInheritedState of(BuildContext context) {
    final _TaskInheritedState? result = context
        .dependOnInheritedWidgetOfExactType<_TaskInherited>()!
        .data;
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  _TaskInheritedState createState() => _TaskInheritedState();
}

class _TaskInheritedState extends State<TaskInherited> {
  List<Task> taskList = [
    Task(name: 'Codar', image: 'assets/images/flutter.png', difficulty: 3),
    Task(name: 'Ler livro', image: 'assets/images/book.jpg', difficulty: 3),
    Task(name: 'Academia', image: 'assets/images/bodybuilder.jpg', difficulty: 2),
  ];

  void newTask(String nameNew, int difficultyNew, String imageNew) {
    setState(() {
      taskList.add(Task(name: nameNew, difficulty: difficultyNew, image: imageNew));
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return _TaskInherited(data: this, child: widget.child);
  }
}

class _TaskInherited extends InheritedWidget {
  final _TaskInheritedState data;

  const _TaskInherited({super.key, required Widget child, required this.data})
      : super(child: child);

  @override
  bool updateShouldNotify(_TaskInherited oldWidget) {
    return oldWidget.data.taskList.length != data.taskList.length;
  }
}
