import 'package:flutter/material.dart';

void main() async {
  runApp(MaterialApp(
      home: Home(),
      theme: ThemeData(
        hintColor: Colors.orange,
        primaryColor: Colors.white,
      )));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final frequencyController = TextEditingController();
  final waveController = TextEditingController();
  final periodController = TextEditingController();
  final soundSpeed = 346;

  void _frequencyChange(String value) {
    double frequency = double.parse(value);
    periodController.text = (1 / frequency * 1000).toStringAsFixed(3);
    waveController.text = (soundSpeed / frequency).toStringAsFixed(3);
  }

  void _waveChange(String value) {
    double wave = double.parse(value);
    frequencyController.text = (soundSpeed / wave).toStringAsFixed(0);
    periodController.text = (1000 / (soundSpeed / wave)).toStringAsFixed(3);
  }

  void _periodChange(String value) {
    double period = double.parse(value);
    frequencyController.text = (1000 / period).toStringAsFixed(0);
    waveController.text = (soundSpeed / ((1 / period) * 1000)).toStringAsFixed(3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Audio Tools"),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 75.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Icon(Icons.surround_sound, size: 125.0, color: Colors.orange),
            buildTextField(
                "Frequency", "Hz", frequencyController, _frequencyChange),
            Divider(),
            buildTextField(
                "Wave Length", "m", waveController, _waveChange),
            Divider(),
            buildTextField(
                "Period", "ms", periodController, _periodChange)
          ]),
        ));
  }
}

Widget buildTextField(String label, String suffix,
    TextEditingController controller, Function function) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.number,
    onChanged: function,
    decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.orange),
        labelText: label,
        suffixText: suffix,
        labelStyle: TextStyle(color: Colors.orange),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange, width: 0.0)),
        border: OutlineInputBorder()),
    style: TextStyle(color: Colors.orange, fontSize: 18.0),
  );
}
