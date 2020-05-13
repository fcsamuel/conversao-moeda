import 'package:flutter/material.dart';

class Conversao extends StatefulWidget {
  @override
  _ConversaoState createState() => _ConversaoState();
}

class _ConversaoState extends State<Conversao> {

  TextEditingController _valorReais = new TextEditingController();
  static double dolares = 5.89;

  String _resultado = "";

  void _converterMoeda() {
    double reais = double.tryParse(_valorReais.text);
    double resultado = (reais / dolares);
    _resultado = "Valor em dólares (US): " + resultado.toStringAsPrecision(2);
    setState(() {
      "$_resultado";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Conversor de Moeda")),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Descubra quanto vale seu dinheiro em dólar",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Informe o valor em reais"),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                controller: _valorReais,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text("Converter", style: TextStyle(fontSize: 17),),
                  onPressed: () {
                    _converterMoeda();
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text("$_resultado", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
