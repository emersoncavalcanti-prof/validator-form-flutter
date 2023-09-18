import 'package:flutter/material.dart';
import 'package:flutter_aula/cadastro_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final controllerNome = TextEditingController();
  final controllerSenha = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: controllerNome,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite seu nome',
                ),
                validator: (nome) {
                  if (nome!.isEmpty) {
                    return 'Digite seu nome';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: controllerSenha,
                obscureText: isObscure,
                keyboardType: TextInputType.number,
                maxLength: 6,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  ),
                  border: const OutlineInputBorder(),
                  labelText: 'Digite sua senha',
                ),
                validator: (senha) {
                  if (senha!.isEmpty) {
                    return 'Digite sua senha';
                  } else if (senha.length < 6) {
                    return 'Digite ao menos 6 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('Nome: ${controllerNome.value.text}');
                    print('senha: ${controllerSenha.value.text}');
                  }
                },
                child: const Text('Entrar'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  final retorno = await Navigator.pushNamed(
                      context, '/cadastro',
                      arguments: {'valor': '20'});
                  print(retorno);
                },
                child: const Text('Cadastre-se'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
