import 'package:flutter/material.dart';

class FormScreenTest extends StatefulWidget {
  const FormScreenTest({super.key});

  @override
  State<FormScreenTest> createState() => _FormScreenTestState();
}

class _FormScreenTestState extends State<FormScreenTest> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final _formkey = GlobalKey <FormState> ();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Nova Tarefa',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
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
                    validator: (String? value){
                      if(value != null && value.isEmpty){
                        return 'Insira o nome da tarefa';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
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
                    validator: (value){
                      if(value!.isEmpty || int.parse(value) < 1 || int.parse(value) > 5){
                        return 'Insira o nível de dificuldade entre 1 e 5!';
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
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Insira uma URL';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.url,
                    textAlign: TextAlign.center,
                    controller: imageController,
                    onChanged: (text) {
                      setState(() {
      
                      });
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
                    color: Colors.red,
                    border: Border.all(width: 2, color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
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
                      )),
                  onPressed: () {
                    if(_formkey.currentState!.validate()){}
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
    );
  }
}
