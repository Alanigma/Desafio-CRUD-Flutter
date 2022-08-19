import 'package:flutter/material.dart';
import 'add_page.dart';

int i = 0;
String nomeAtual = '';
String emailAtual = '';
String cepAtual = '';
String ruaAtual = '';
String bairroAtual = '';
String cidadeAtual = '';
String ufAtual = '';

class VerPage extends StatefulWidget {
  const VerPage({Key? key}) : super(key: key);

  @override
  State<VerPage> createState() => _VerPageState();
}

class _VerPageState extends State<VerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Visualizar usuários')),
      body: ListView.builder(
          itemCount: usuarios.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 20,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text('Nome: ${usuarios[index].nome}')),
                      Expanded(
                          flex: 1,
                          child: Text('Email: ${usuarios[index].email}')),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1, child: Text('Cep: ${usuarios[index].cep}')),
                      Expanded(
                          flex: 1, child: Text('Rua: ${usuarios[index].rua}')),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text('Bairro: ${usuarios[index].bairro}')),
                      Expanded(
                          flex: 1,
                          child: Text('Cidade: ${usuarios[index].cidade}')),
                      Expanded(
                          flex: 1, child: Text('UF: ${usuarios[index].uf}')),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            nomeAtual = usuarios[index].nome ?? '';
                            emailAtual = usuarios[index].email ?? '';
                            cepAtual = usuarios[index].cep ?? '';
                            ruaAtual = usuarios[index].rua ?? '';
                            bairroAtual = usuarios[index].bairro ?? '';
                            cidadeAtual = usuarios[index].cidade ?? '';
                            ufAtual = usuarios[index].uf ?? '';
                            i = index;

                            Navigator.of(context).pushNamed('/update');
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              usuarios.removeAt(index);
                            });
                          },
                          icon: const Icon(Icons.delete))
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
