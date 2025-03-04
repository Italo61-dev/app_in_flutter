import 'package:first_project/components/task.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {

  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.blue,
        title: Text(
          'Tarefas',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: Duration(milliseconds: 800),
        child: ListView(
          children: [
            Task(name: 'Codar',image: 'assets/images/flutter.png',difficulty: 3,),
            Task(name: 'Ler livro',image: 'assets/images/book.jpg',difficulty: 3,),
            Task(name: 'Academia',image: 'assets/images/bodybuilder.jpg',difficulty: 2,),
            SizedBox(height: 80,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () {
          setState(() {
            opacity = !opacity;
          });
        },
        child: Icon(
          Icons.remove_red_eye,
          color: Colors.white,
        ),
      ),
    );
  }
}
