import 'package:flutter/material.dart';
import 'package:flutter_aula/cadastro_page.dart';
import 'package:flutter_aula/home_page.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const HomePage(),
      '/cadastro': (context) => const CadastroPage(),
    },
  ));
}
