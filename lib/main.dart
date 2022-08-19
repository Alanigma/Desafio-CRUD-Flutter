import 'package:desafio_crud/pages/add_page.dart';
import 'package:desafio_crud/pages/home_page.dart';
import 'package:desafio_crud/pages/update_page.dart';
import 'package:desafio_crud/pages/ver_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio CRUD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      //Rotas
      routes: {
        '/': (context) => const HomePage(),
        '/add':(context) => const AddPage(),
        '/view':(context) => const VerPage(),
        '/update':(context) => const UpdatePage(),
      },
    );
  }
}
