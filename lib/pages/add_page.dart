import 'package:brasil_fields/brasil_fields.dart';
import 'package:desafio_crud/objetos/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<Usuario> usuarios = [];

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  final nome = TextEditingController();
  final email = TextEditingController();
  final cep = TextEditingController();
  final rua = TextEditingController();
  final bairro = TextEditingController();
  final cidade = TextEditingController();
  final uf = TextEditingController();

  void achacep() async {
    String cepTexto = cep.text.replaceAll('.', '').replaceAll('-', '');
    String url = "https://viacep.com.br/ws/$cepTexto/json/";

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> dados = json.decode(response.body);
    setState(() {
      rua.text = dados['logradouro'] ?? '';
      bairro.text = dados['bairro'] ?? '';
      cidade.text = dados['localidade'] ?? '';
      uf.text = dados['uf'] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Adicionar usuário'),
        ),
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      child: TextFormField(
                        controller: nome,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nome',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo não pode ser nulo';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      child: TextFormField(
                        controller: email,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@') || !value.contains('.com')) {
                            return 'Falha na validação do email.';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      child: TextFormField(
                        controller: cep,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'CEP',
                        ),
                        onChanged: (value) {
                          if (value.length == 10) achacep();
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CepInputFormatter(),
                        ],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo não pode ser nulo';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      child: TextFormField(
                        controller: rua,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Rua',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo não pode ser nulo';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      child: TextFormField(
                        controller: bairro,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Bairro',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo não pode ser nulo';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      child: TextFormField(
                        controller: cidade,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Cidade',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo não pode ser nulo';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      child: TextFormField(
                        controller: uf,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'UF',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo não pode ser nulo';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(24),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              usuarios.add(Usuario(
                                  nome: nome.text,
                                  email: email.text,
                                  cep: cep.text,
                                  rua: rua.text,
                                  bairro: bairro.text,
                                  cidade: cidade.text,
                                  uf: uf.text));
                              Navigator.pop(context);
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text("Enviar"),
                          ),
                        )),
                  ],
                ))));
  }
}
