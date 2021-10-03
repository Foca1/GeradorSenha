import 'package:flutter/material.dart';
import 'Principal/tela_inicial.dart';

main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaPrincipal(),
      debugShowCheckedModeBanner: false,
    );
  }
}
