import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'tela_inicial.dart';

final _saved = TelaPrincipal.saved;

class pushSaved extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tiles = _saved.map((_saved) {
      return ListTile(
        title: Text(_saved, style: const TextStyle(fontSize: 18)),
      );
    });

    final divided = tiles.isNotEmpty
        ? ListTile.divideTiles(tiles: tiles, context: context).toList()
        : <Widget>[];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 70, left: 10),
          child: Column(
            children: [
              // Parte Superior
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_rounded),
                    iconSize: 25,
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    "Senhas Salvas",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
