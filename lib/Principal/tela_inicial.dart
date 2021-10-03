import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gerar_senha/Principal/tela_salvos.dart';
import '../senhas.dart';

class _TelaPrincipal extends State<TelaPrincipal> {
  final controller = TelaPrincipal.controller;
  final List saved = TelaPrincipal.saved;

  double _currentValue = 8;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget main() {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            password_box(),
            const SizedBox(height: 20),
            difficult_sld()
          ],
        ),
      ),
    );
  }

  Widget password_box() {
    final isSaved = saved.contains(controller.text)
        ? Icons.favorite
        : Icons.favorite_border;

    return Column(
      children: [
        TextFormField(
          controller: controller,
          readOnly: true,
          enableInteractiveSelection: false,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  if (saved.contains(controller.text)) {
                    saved.remove(controller.text);
                  } else {
                    saved.add(controller.text);
                  }
                });
              },
              icon: Icon(
                isSaved,
                color: Colors.blueAccent[100],
                semanticLabel: 'Favoritar',
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            controller.text = generatePassword(length: _currentValue.toInt());
            setState(() => isSaved);
          },
          child: Text(
            "Gerar Senha",
            style: TextStyle(
              color: Colors.blueAccent[100],
              fontSize: 18,
            ),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.black26, fixedSize: const Size(250, 50)),
        ),
      ],
    );
  }

  Widget difficult_sld() {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.blueAccent[100],
          activeTickMarkColor: Colors.blueAccent[100],
          inactiveTrackColor: Colors.black26,
          inactiveTickMarkColor: Colors.black26,
          trackHeight: 4.0,
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 15.0),
          valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
          valueIndicatorTextStyle:
              const TextStyle(color: Colors.white, fontSize: 15)),
      child: Slider(
        value: _currentValue,
        min: 4,
        max: 20,
        divisions: 4,
        label: _currentValue.round().toString(),
        onChanged: (double value) {
          setState(() => _currentValue = value);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black87,
          title: const Text(
            'Gerador de senha',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => pushSaved()));
                },
                icon: const Icon(
                  Icons.favorite,
                  size: 25,
                ))
          ],
        ),
        body: Center(child: main()),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  static var controller = TextEditingController();
  static var saved = [];
  @override
  State<TelaPrincipal> createState() => _TelaPrincipal();
}
