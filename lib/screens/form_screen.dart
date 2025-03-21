import 'package:first_project/data/task_inherited.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool valueValidator(String? value){
    if(value != null && value.isEmpty){
      return true;
    }
    return false;
  }
  bool difficultyValidator(String? value){
    if(value != null && value.isEmpty){
      if(int.parse(value) > 5 ||
          int.parse(value) < 1){
        return true;
      }
    }
    return false;
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Nova Tarefa',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 390,
              height: 750,
              decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(width: 3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Insira o nome da TAREFA!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Nome',
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (difficultyValidator(value)) {
                          return 'Insira o nível de DIFICULDADE!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      controller: difficultyController,
                      decoration: InputDecoration(
                        hintText: 'Dificuldade',
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Insira a URL DA IMAGEM!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      textAlign: TextAlign.center,
                      controller: imageController,
                      onChanged: (text) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        hintText: 'Imagem',
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    width: 72,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 2,
                        color: Colors.blue,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imageController.text,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/nophoto.png',
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        TaskInherited.of(widget.taskContext).newTask(
                            nameController.text,
                            int.parse(difficultyController.text),
                            imageController.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Tarefa adicionada'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'Adicionar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
