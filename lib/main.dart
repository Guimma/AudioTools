import 'package:flutter/material.dart';

const request = "https://api.hgbrasil.com/finance?format=json&key=2ca1648f";

void main() async {
  runApp(MaterialApp(
      home: Home(),
      theme: ThemeData(
        hintColor: Colors.deepOrange,
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
  final soundSpeed = 343;

  void _frequencyChange(String value){
    double frequency = double.parse(value);
    periodController.text = (1/frequency).toStringAsFixed(4);
    waveController.text = (soundSpeed/frequency).toStringAsFixed(4);
  }

  void _waveChange(String value){
    double wave = double.parse(value);
    frequencyController.text = (soundSpeed/wave).toStringAsFixed(2);
    periodController.text = (1/(soundSpeed/wave)).toStringAsFixed(2);
  }

  void _periodChange(String value){
    double period = double.parse(value);
    frequencyController.text = (1/period).toStringAsFixed(2);
    waveController.text = (soundSpeed/(1/period)).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Audio Tools"),
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
        ),
        body: 
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 75.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(Icons.surround_sound,
                      size: 125.0, color: Colors.deepOrange),
                  buildTextField("Frequency", "Heartz", frequencyController, _frequencyChange),
                  Divider(),
                  buildTextField("Wave Length", "meters", waveController, _waveChange),
                  Divider(),
                  buildTextField("Period", "miliseconds", periodController, _periodChange)
                ]),
          )
        );
  }
}

Widget buildTextField(String label, String suffix, TextEditingController controller, Function function) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.number,
    onChanged: function,
    decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.deepOrange),
        labelText: label,
        suffixText: suffix,
        labelStyle: TextStyle(color: Colors.deepOrange),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrange, width: 0.0)),
        border: OutlineInputBorder()),
    style: TextStyle(color: Colors.deepOrange, fontSize: 18.0),
  );
}
