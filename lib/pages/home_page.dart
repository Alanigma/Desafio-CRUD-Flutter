import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio CRUD'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: (() {
                  Navigator.of(context).pushNamed('/add');
                }),
                child: const Text('Adicionar usuário')
            ),
            ElevatedButton(
                onPressed: (() {
                  Navigator.of(context).pushNamed('/view');
                }),
                child: const Text('Ver usuários')
            ),
          ],
        ),
      ),
    );
  }
}
