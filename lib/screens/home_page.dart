import 'package:flutter/material.dart';
import '../models/persona.dart';
import 'personal_page.dart';
import 'widget_page.dart';

//pantalla principal de l'app, es stateful perque reb persona modificada desde PersonalPage i
//ha de actualitzar la UI amb dades noves cada pic que se modifiquen
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Persona? personaActual;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PF2'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Benvingut a l'aplicació PF2",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              if (personaActual != null)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Persona guardada:\n${personaActual!.nomComplet}',
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

              if (personaActual != null) const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () async {
                  final personaDefault = personaActual ?? Persona( //Si no hi ha res, persona per defecte, sino, la persona actual
                    nom: 'Izan',
                    cognom: 'Moreno',
                    datNaix: DateTime(2006, 2, 9),
                    correu: 'izanmoreno@paucasesnovescifp.cat',
                    password: '1234',
                  );

                  final resultat = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PersonalPage(persona: personaDefault),
                    ),
                  );

                  if (resultat is Persona) {
                    setState(() {
                      personaActual = resultat;
                    });
                  }
                },
                child: const Text('Anar a PersonalPage'),
              ),
              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WidgetPage()
                    ),
                  );
                },
                child: const Text('Anar a WidgetPage'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
