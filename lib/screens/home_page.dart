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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PF2'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const.edgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainxAxisAlignment.center,
            children: [
              const Text(
                "Benvingut a l'aplicacio PF2",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              sizedBox(height: 30),
              ElevatedButton(

              )
            ]
          )
        ),
      ),
    );
  }
}