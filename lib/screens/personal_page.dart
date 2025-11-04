import 'package:flutter/material.dart';
import 'package:pf2/models/persona.dart';

//Page per editar una Persona
//És stateful perquè els camps del formulari canvien amb l'entrada de l'usuari

class PersonalPage extends StatefulWidget {
  final Persona persona;

  const PersonalPage({super.key, required this.persona});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  //Controlers per als camps del formulari
  late TextEditingController _nomController;
  late TextEditingController _cognomController;
  late TextEditingController _correuController;
  late TextEditingController _passwordcontroller;

  //Data de naixement
  DateTime _dataNaixement = DateTime.now();
  @override
  void initState() {
    super.initState();
    //Inicialitzam els controladors amb les dades rebudes
    _nomController = TextEditingController(text: widget.persona.nom);
    _cognomController = TextEditingController(text: widget.persona.cognom);
    _correuController = TextEditingController(text: widget.persona.correu);
    _passwordcontroller = TextEditingController(text: widget.persona.password);
    _dataNaixement = widget.persona.datNaix;

    _passwordcontroller.addListener((){
      setState(() {});
    });
  }
  @override
  void dispose() {
    //Alliberar memoria
    _nomController.dispose();
    _cognomController.dispose();
    _correuController.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moreno'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Nom
              TextField(
                controller: _nomController,
                decoration: InputDecoration(
                  hintText: 'Nom de l\'usuari',
                  labelText: 'Nom',
                  suffixIcon: const Icon(Icons.supervised_user_circle),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              //Cognom
              TextField(
                controller: _cognomController,
                decoration: InputDecoration(
                  hintText: 'Cognom de l\'usuari',
                  labelText: 'Cognom',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //Data de naixement
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Data de naixement: ${_dataNaixement.day}/${_dataNaixement.month}/${_dataNaixement.year}',
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(),
                      onPressed: () async {
                        DateTime? novaData = await showDatePicker(
                          context: context,
                          initialDate: _dataNaixement,
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (novaData != null) {
                          setState(() {
                            _dataNaixement = novaData;
                          });
                        }
                      },
                      child: const Text('Selecciona Data'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              //Correu
              TextField(
                controller: _correuController,
                decoration: InputDecoration(
                  hintText: 'Correu Electronic',
                  labelText: 'Correu',
                  suffixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              //Contrassenya
              TextField(
                controller: _passwordcontroller,
                decoration: InputDecoration(
                  hintText: 'Contrasenya Segura',
                  labelText: 'Contrasenya',
                  counterText: 'Lletres: ${_passwordcontroller.text.length}',
                  suffixIcon: const Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                obscureText: true,
              ),
              //Botó per guardar
              ElevatedButton(
                onPressed: () {
                  final personaEditada = widget.persona.copyWith(
                    nom: _nomController.text,
                    cognom: _cognomController.text,
                    datNaix: _dataNaixement,
                    correu: _correuController.text,
                    password: _passwordcontroller.text,
                  );
                  Navigator.pop(context, personaEditada);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('Guardar', style: TextStyle(fontSize: 18),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}