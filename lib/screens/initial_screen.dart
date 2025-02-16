import 'package:first_project/components/task.dart';
import 'package:first_project/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView(
        children: [
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
          SizedBox(
            height: 80,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormScreen(),
            ),
          );
        },
        backgroundColor: Colors.blue,
        shape: CircleBorder(),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
