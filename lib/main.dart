import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { //Stateless perque s'app principal no canvia el seu estat mai
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true, //Per utilitzar la versio mes moderna de google
      ),
      home: const HomePage(),
    );
  }
}