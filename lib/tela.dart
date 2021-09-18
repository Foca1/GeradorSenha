import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'senhas.dart';

class _TelaPrincipal extends State<TelaPrincipal> {
  final _controller = TextEditingController();
  double _currentValue = 8;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget all() {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            password_box(),
            const SizedBox(height: 15),
            password_bttn(),
            const SizedBox(height: 20),
            difficult_sld()
          ],
        ),
      ),
    );
  }

  Widget password_box() {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            final data = ClipboardData(text: _controller.text);
            Clipboard.setData(data);
          },
          icon: Icon(
            Icons.copy,
            color: Colors.blueAccent[100],
          ),
        ),
      ),
    );
  }

  Widget password_bttn() {
    return ElevatedButton(
      onPressed: () {
        _controller.text = generatePassword(length: _currentValue.toInt());
      },
      child: Text("Gerar Senha",
          style: TextStyle(color: Colors.blueAccent[100], fontSize: 18)),
      style: ElevatedButton.styleFrom(
          primary: Colors.black26, fixedSize: const Size(250, 50)),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: Center(child: all()),
      ),
      debugShowCheckedModeBanner: false,
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
}

class TelaPrincipal extends StatefulWidget {
  @override
  State<TelaPrincipal> createState() => _TelaPrincipal();
}
